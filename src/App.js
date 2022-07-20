import logo from './logo.svg';
import './App.css';
import {BrowserRouter} from 'react-router-dom';
import Navbar from './component/Navbar';
import Mid from './component/Mid';


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
