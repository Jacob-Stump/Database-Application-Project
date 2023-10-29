package main

import ( //basically same as java imports

	"database/sql"  //interface for querying/interacting with database
	"encoding/json" //for formatting/encoding/decoding json strings
	"fmt"
	"log"      //for logging problems/issues
	"net/http" //used for http requests/ http.ResponseWriter, *http.Request

	"github.com/go-sql-driver/mysql" //driver for mySQL connection
	"github.com/gorilla/handlers"    //works with net/http package to validate content types, allow access via CORS, compressing http responses
	"github.com/gorilla/mux"         //used to make handling multiple path variables/endpoint connections and related methods
)

type NewProduct struct { //essentially a java class, a struct is an object in Go and we are making a new product object called NewProduct

	//using the encoding/json package we imported, we can use the name declared "product_name" when unmarshaling the json. Same for the other attributes.
	Name     string `json:"product_name"`
	Desc     string `json:"descr"`
	Price    string `json:"price"`
	Img      string `json:"imgurl"`
	Quantity int    `json:"quantity"`
}

type AllProducts struct {
	Name     string `json:"product_name"`
	Desc     string `json:"descr"`
	Price    string `json:"price"`
	Img      string `json:"imgurl"`
	Quantity int    `json:"quantity"`
}

func addProduct(w http.ResponseWriter, r *http.Request) { //method that will take in the json from the hit endpoint, parse it, and create a NewProduct object from it. Then we will make a db query that inserts the attributes of that object.
	var request NewProduct //making variable from our struct from our request json

	err := json.NewDecoder(r.Body).Decode(&request) //unmarshaling the json from the endpoint, creating an object that has the attributes our json contained
	fmt.Print(err)

	if err != nil {
		return
	}

	cfg := mysql.Config{ //making our DB config to connect
		User:   "admin_name",
		Passwd: "database_password",
		Net:    "tcp",
		Addr:   "localhost:3306",
		DBName: "our_db_name",
	}

	db, err := sql.Open("mysql", cfg.FormatDSN()) //using DB config to connect

	if err != nil {
		panic(err)
	}

	defer db.Close()

	insertStatement, err := db.Prepare("INSERT INTO products (product_id, product_name, descr, price, imgurl, quantity) VALUES (?,?,?,?,?,?)") //creating prepared insert statement using databast/sql import package.

	if err != nil {
		return
	}

	defer insertStatement.Close()

	fmt.Print(request)
	_, err = insertStatement.Exec(0, request.Name, request.Desc, request.Price, request.Img, request.Quantity) //executing the prepared insert statement and we are done. The product *should* be added to the database.

	if err != nil {
		panic(err.Error())
	}
}

func getProducts(w http.ResponseWriter, r *http.Request) {

	cfg := mysql.Config{ //making our DB config to connect
		User:   "root",
		Passwd: "Frodobaggins123",
		Net:    "tcp",
		Addr:   "localhost:3306",
		DBName: "golang",
	}

	db, err := sql.Open("mysql", cfg.FormatDSN()) //using DB config to connect

	if err != nil {
		panic(err)
	}

	defer db.Close()

	tuples, err := db.Query("SELECT product_name, descr, price, imgurl, quantity FROM products")

	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	defer tuples.Close()

	var products []AllProducts

	for tuples.Next() { //for every row in products table..
		var p AllProducts
		err := tuples.Scan(&p.Name, &p.Desc, &p.Price, &p.Img, &p.Quantity)
		if err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}

		products = append(products, p)
	}
	//returning the product information as JSON
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(products)
}

func handleRequest(corsMiddleware func(http.Handler) http.Handler) { //method that utilizes mux import for handling multiple requests (we will have many requests for our project)
	myRouter := mux.NewRouter().StrictSlash(true) //creating a new router instance to handle http requests
	myRouter.Use(corsMiddleware)                  //telling our router to use the cors parameters we set

	myRouter.HandleFunc("/addProduct", addProduct) //every time this https://localhost:8080/addProduct endpoint is hit from our front end code, we will utilize the addProduct function/method
	myRouter.HandleFunc("/inventory", getProducts)
	//add more endpoints and associated funcs here
	//add more endpoints and associated funcs here
	//add more endpoints and associated funcs here
	log.Fatal(http.ListenAndServe(":8080", myRouter)) //making our server address listen on port 8080
}

func main() {

	//you cannot send HTTP if CORS is not enabled
	corsMiddleware := handlers.CORS( //creates new CORS (Cross-Origin Resource Sharing) instance. Middleware for HTTP server allowing for specification on which origins, methods, and headers are allowed in cross-origin requests
		handlers.AllowedOrigins([]string{"http://localhost:3000"}),                   // allowing which domains can send requests to the server, company's would have their website here
		handlers.AllowedMethods([]string{"GET", "POST", "PUT", "DELETE", "OPTIONS"}), //allowing all http methods, for this initial program we will be using POST
		handlers.AllowedHeaders([]string{"Content-Type"}),                            //specifying the header(s) allowed
	)

	handleRequest(corsMiddleware) //go to the handleRequest method from here, sending our corsMiddleWare variable with it

}
