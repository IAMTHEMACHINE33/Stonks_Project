import { Component } from "react";
import {Link}from "react-router-dom";

const Navbar = ()=>{

  var nav;
  if(localStorage.getItem("ticket")){
    nav = (
      <>
        <li className="nav-item">
      <Link className="nav-link " to="/home">Dashboard</Link>
    </li>
    <li className="nav-item">
      <Link className="nav-link " to="/logout">Logout</Link>
    </li>

          
      </>
    )

  }
  else{
      nav = (
          <>
            <li className="nav-item">
      <Link className="nav-link " to="/register">Register</Link>
    </li>
    <li className="nav-item">
      <Link className="nav-link " to="/login">Login</Link>
    </li>
          </>
      )
  }

    return(
        <div className="container">
        <nav className="navbar navbar-expand-lg navbar-light bg-light">
<Link className="navbar-brand" to="#">Navbar</Link>
<button className="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
<span className="navbar-toggler-icon"></span>
</button>

<div className="collapse navbar-collapse" id="navbarSupportedContent">
<ul className="navbar-nav mr-auto">
  <li className="nav-item active">
    <Link className="nav-link" to="/">Home <span className="sr-only">(current)</span></Link>
  </li>
 
  <li className="nav-item">
    <Link className="nav-link " to="/add_product">Add Stocks</Link>
  </li>
  <li className="nav-item">
    <Link className="nav-link " to="/update_product">Update Stocks</Link>
  </li>
  <li className="nav-item">
    <Link className="nav-link " to="/update_customer">Update User</Link>
  </li>
  <li className="nav-item">
    <Link className="nav-link " to="/show_product">View Stocks</Link>
  </li>
  {nav}
</ul>

</div>
</nav>
    </div>
    );
}

export default Navbar;