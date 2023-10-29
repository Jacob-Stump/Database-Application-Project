'use client'
import React, {useState, useEffect} from 'react';
import { Container, Grid, Paper, Typography } from '@mui/material';


const MyComponent = () => {
  const [data, setData] = useState<Array<{product_name: string; descr: string; price: string; imgurl: string; quantity: number}>>([]);
  
  useEffect(() => {
    //this effect will run when the component mounts
    fetch('http://localhost:8080/inventory')
      .then((response) => response.json())
      .then((result) => {
        setData(result);
      })
      .catch((error) => {
        console.error('Error fetching data');
      });
    }, []);

    return (
      <div>
        <h2>Data Table</h2>
        <table>
          <thead>
            <tr>
              <th>Product Name</th>
              <th>Description</th>
              <th>Price</th>
              <th>Image</th>
              <th>Quantity</th>
            </tr>
          </thead>
          <tbody>
            {data.map((item, index) => (
              <tr key={index}>
                <td>{item.product_name}</td>
                <td>{item.descr}</td>
                <td>{item.price}</td>
                <td>{item.imgurl}</td>
                <td>{item.quantity}S</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    );
  };
  
  export default MyComponent;
 

