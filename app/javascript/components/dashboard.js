export { addChild }
export { addAccount }
export { loadingCharts }

const childCamembert = () => {
  const dataChildDiv = document.querySelector("#pie-chart-container");
  const dataChild = dataChildDiv.getAttribute("data-set");
  const dataJson = JSON.parse(dataChild);
  return dataJson;
};

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

const addAccount = () => {
  const addAccountForm = document.querySelector(".account-add-form");
  const btnAddAccount = document.querySelector("#add-account");

  if (btnAddAccount) {
    btnAddAccount.addEventListener("click", () => {
      addAccountForm.classList.remove("disable");
      addAccountForm.classList.add("active");
      btnAddAccount.classList.add("disable");
    })
  }
}

const loadingCharts = () => {
  const json = childCamembert();
  Highcharts.chart('pie-chart-container', {
    chart: {
      plotBackgroundColor: null,
      plotBorderWidth: null,
      plotShadow: false,
      type: 'pie'
    },
    title: {
      text: 'Browser market shares in January, 2018'
    },
    tooltip: {
      pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    },
    accessibility: {
      point: {
        valueSuffix: '%'
      }
    },
    plotOptions: {
      pie: {
        allowPointSelect: true,
        cursor: 'pointer',
        dataLabels: {
          enabled: true,
          format: '<b>{point.name}</b>: {point.percentage:.1f} %'
        }
      }
    },
    series: [{
      name: 'Brands',
      colorByPoint: true,
      data: [{
        name: 'Comédie',
        y: json.Comédie,
        sliced: true,
        selected: true
      }, {
        name: 'Educatif',
        y: json.Educatif
      }]
    }]
  });
};
