import { useState } from "react";
import axios from 'axios';

const Register =()=>{
    const [username, setUsername] = useState('');
    const [firstname, setFirstname] = useState('');
    const [lastname, setLastname] = useState('');
    const [age, setAge] = useState('');
    const [password, setPassword] = useState('');
    const [email, setEmail] = useState('');
    const [image, setImage] = useState('');
    const [message, setMessage] = useState('');

    const registerUser = (e)=>{
        e.preventDefault();
        // const data = {
        //     username: username,
        //     firstname: firstname,
        //     lastname: lastname,
        //     age: age,
        //     email: email,
        //     password: password,
        //     user_img:image
        // };
        const data = new FormData();
        data.append("username",username);
        data.append("firstname",firstname);
        data.append("lastname",lastname);
        data.append("age",age);
        data.append("email",email);
        data.append("password",password);
        data.append("user_img",image);
        axios
            .post("http://localhost:90/user/insert",data)
            .then((response)=>{
                if(response.data.msg="Added"){
                    setMessage("User Registered successfully");
                    console.log(response);
                }
                else{
                    setMessage("Failed to register");
                    console.log(response);
                }
            })
            .catch()
    };
    return(
        <div className="container">
            <div className="row">
                <div className="col-md-4">
                    <h1>Register</h1>
                    <form>
                        <div className="form-group">
                            <label>Username</label>
                            <input type='text' className="form-control" onChange={(e)=>{setUsername(e.target.value)}}/>
                        </div>
                        <div className="form-group">
                            <label>Firstname</label>
                            <input type='text' className="form-control" onChange={(e)=>{setFirstname(e.target.value)}}/>
                        </div>
                        <div className="form-group">
                            <label>Lastname</label>
                            <input type='text' className="form-control" onChange={(e)=>{setLastname(e.target.value)}}/>
                        </div>
                        <div className="form-group">
                            <label>Age</label>
                            <input type='text' className="form-control" onChange={(e)=>{setAge(e.target.value)}}/>
                        </div>
                        <div className="form-group">
                            <label>Password</label>
                            <input type='text' className="form-control" onChange={(e)=>{setPassword(e.target.value)}}/>
                        </div>
                        <div className='form-group'>
                            <label>Image</label>
                            <input type='file' className="form-control" onChange={(e)=>{setImage(e.target.files[0])}}/>
                        </div>
                        <div className="form-group">
                            <label>Email</label>
                            <input type='text' className="form-control" onChange={(e)=>{setEmail(e.target.value)}}/>
                        </div>
                        <div className="form-group">
                            <input type="submit" onClick={registerUser}/>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    );   
}

export default Register;