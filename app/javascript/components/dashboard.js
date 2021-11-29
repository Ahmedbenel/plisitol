const addChild = () => {
  const addChildForm = document.querySelector(".child-add-form");
  const btnPlus = document.querySelector("#create-child");

  if (btnPlus) {
    btnPlus.addEventListener("click", () => {
      addChildForm.classList.remove("disable");
      addChildForm.classList.add("active");
      btnPlus.classList.add("disable");
    })
  }
}

export { addChild }







const myTestHighCharts = document.addEventListener('DOMContentLoaded', function () {
  const chart = Highcharts.chart('container', {
    chart: {
      type: 'bar'
    },
    title: {
      text: 'Fruit Consumption'
    },
    xAxis: {
      categories: ['Apples', 'Bananas', 'Oranges']
    },
    yAxis: {
      title: {
        text: 'Fruit eaten'
      }
    },
    series: [{
      name: 'Jane',
      data: [1, 0, 4]
    }, {
      name: 'John',
      data: [5, 7, 3]
    }]
  });
});

export { myTestHighCharts }
