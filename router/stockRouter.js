const express = require("express");
const axios = require("axios");
const cheerio = require("cheerio");
const router = new express.Router();
const Stock = require("../model/stockModel");

async function getPrice(){
  try {
    const siteUrl = "https://www.sharesansar.com/today-share-price";

    const{ data } = await axios({
      method : "GET",
      url : siteUrl,
    })
  
    const $ = cheerio.load(data)
    const elemSelector = '#headFixed > tbody > tr'
  
    const keys =[
      'No',
      'Symbol',
      'Conf',
      'Open',
      'High',
      'Low',
      'Close',
      'VWAP',
      'Vol',
      'Prev_Close',
      'Turnover',
      'Trans',
      'Diff',
      'Range',
      'Diff_Perc',
      'Range_Perc',
      'VWAP_Perc',
      'OneTwenty_Days',
      'OneEighty_Days',
      'FiftyTwo_Weeks_High',
      'FiftyTwo_Weeks_Low',

    ]
    
    const coinArr =[];

    $(elemSelector).each((ind, ele)=>{
      let keyInd = 0
      const coinObj ={};
      

      if (ind <=4){
          $(ele).children().each((cind,cele)=>{
              const tdValue = $(cele).text().trim();
              
              if (tdValue ){
                  coinObj[keys[keyInd]] = tdValue
                  // console.log(tdValue)
                  // console.log(keys[keyInd])
                  
                  

                  keyInd++
                  
              }
          })
          // console.log(coinObj)
          
          coinArr.push(coinObj)
      }

      
  }) 
  return coinArr
  } catch (err) {
      console.error(err)
  }
}

// getPrice()

router.get('/states',async(req,res)=>{
  try {
      const pricefeed = await getPrice()
      
      return res.json({
          result: pricefeed,
      })
  } catch (err) {
      return res.json({
          err:err.toString(),
      })
  }
})


async function post(){
  try {
      const response = await getPrice()
      // const response = await data.json();
      // console.log(data);
      console.log(response.length)
      for(let i=0; i< response.length; i++){
          const data = new Stock({
              No:response[i]['No'],
              Symbol:response[i]['Symbol'],
              Conf:response[i]['Conf'],
              Open:response[i]['Open'],
              High:response[i]['High'],
              Low:response[i]['Low'],
              Close:response[i]['Close'],
              VWAP:response[i]['VWAP'],
              Vol:response[i]['Vol'],
              Prev_Close:response[i]['Prev_Close'],
              Turnover:response[i]['Turnover'],
              Trans:response[i]['Trans'],
              Diff:response[i]['Diff'],
              Range:response[i]['Range'],
              Diff_Perc:response[i]['Diff_Perc'],
              Range_Perc:response[i]['Range_Perc'],
              VWAP_Perc:response[i]['VWAP_Perc'],
              OneTwenty_Days:response[i]['OneTwenty_Days'],
              OneEighty_Days:response[i]['OneEighty_Days'],
              FiftyTwo_Weeks_High:response[i]['FiftyTwo_Weeks_High'],
              FiftyTwo_Weeks_Low:response[i]['FiftyTwo_Weeks_Low'],

          });
          data.save();
      }

  } catch (err) {
      return console.log(err.toString)
  }
}
post()

module.exports=router;