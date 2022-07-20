import {Routes, Route} from "react-router-dom";
import Register from "./Register";
import Home from "./Home";
import Login from "./Login";
import Logout from "./Logout";

const Mid = ()=>{
    return(
        <Routes>
            <Route path="/" element={<Home/>}></Route>
            <Route path="/Register" element={<Register/>}></Route>
            <Route path="/Login" element={<Login/>}></Route>
            <Route path="/Logout" element={<Logout/>}></Route>
        </Routes>
    );
};

export default Mid;