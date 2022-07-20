import logo from './logo.svg';
import './App.css';
import {BrowserRouter} from 'react-router-dom';
import Navbar from './Components/Navbar';
import Mid from './Components/Mid';


function App() {
  return (
    <>
    <BrowserRouter>
    <Navbar></Navbar>
    <Mid></Mid>
    </BrowserRouter>
    </>
  );
}

export default App;
