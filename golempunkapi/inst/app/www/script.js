  const get_rand_beer = () => {
    fetch("https://api.punkapi.com/v2/beers/random").then((data) =>{
      data.json().then((res) => {
        //x = res;
        Shiny.setInputValue("main_ui_1-beer", res, {priority: 'event'})
        document.querySelector(".innerprint")
      })
    }).catch((error) => {
      alert("Error catchin result from API")
    })
  };