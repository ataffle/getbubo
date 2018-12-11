import Chart from "chart.js"

const initLine = () => {
  let ctx = document.getElementById("monthly-amount")
  if (ctx) {
  ctx = ctx.getContext('2d');

  //console.log(ctx)
  //console.log(ctx.canvas.dataset.statuses)
  const six = JSON.parse(ctx.canvas.dataset.six);
  const five = JSON.parse(ctx.canvas.dataset.five);
  const four = JSON.parse(ctx.canvas.dataset.four);
  const three = JSON.parse(ctx.canvas.dataset.three);
  const two = JSON.parse(ctx.canvas.dataset.two);
  const current = JSON.parse(ctx.canvas.dataset.current);
  // console.log(typeof statuses);
  // const invoices = statuses.filter(function(x) { return x === "Facture en attente" }).length
  // const payments = statuses.filter(function(x) { return x === "Paiement en attente" }).length
  // const paid = statuses.filter(function(x) { return x === "Payé" }).length
  const myChart = new Chart(ctx, {
      type: 'line',
      data: {
          labels: ["M-6", "M-5", "M-4", "M-3", "M-2", "Courant"],
          datasets: [{
              label: "Montant mensuel",
              data: [six, five, four, three, two, current],
              backgroundColor: [
                  'rgba(0, 0, 0, 0)',
              ],
              borderColor: [
                  'rgba(15, 51, 78, 1)',
              ],
              pointBackgroundColor:
                  'rgba(64, 190, 194, 1)',
              pointBorderColor:
                  'rgba(15, 51, 78, 1)',
              borderWidth: 1,
          }]
      },
      options: {
        legend: {
          display: false
        },
        layout: {
         padding: {
             left: 32,
             right: 32,
             top: 32,
             bottom: 32
           }
         },
        scales: {
          xAxes: [{
              gridLines: {

              }
          }],
          yAxes: [{
            gridLines: {
              color: "rgba(0, 0, 0, 0)"
            },
            ticks: {
              stepSize: 100
            }
          }]
        }
      }
  });
  }
}

export { initLine };
