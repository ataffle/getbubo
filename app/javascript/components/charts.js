import Chart from "chart.js"

const initChart = () => {
  let ctx = document.getElementById("commitments-statuses")
  if (ctx) {
  ctx = ctx.getContext('2d');

  //console.log(ctx)
  //console.log(ctx.canvas.dataset.statuses)
  const statuses = JSON.parse(ctx.canvas.dataset.statuses);
  // console.log(ctx.canvas.dataset);
  // console.log(typeof statuses);
  const invoices = statuses.filter(function(x) { return x === "Facture en attente" }).length
  const payments = statuses.filter(function(x) { return x === "Paiement en attente" }).length
  const paid = statuses.filter(function(x) { return x === "Payé" }).length
  const myChart = new Chart(ctx, {
      type: 'bar',
      data: {
          labels: ["Facture en attente", "Paiement en attente", "Payé"],
          datasets: [{
              label: "Statut des factures",
              data: [invoices, payments, paid],
              backgroundColor: [
                  'rgba(64, 190, 194, 1)',
                  'rgba(15, 51, 78, 1)',
                  'rgba(255, 99, 132, 1)',
              ],
              borderColor: [
                  'rgba(64, 190, 194, 1)',
                  'rgba(15, 51, 78, 1)',
                  'rgba(255,99,132,1)',
              ],
              borderWidth: 1
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
                  color: "rgba(0, 0, 0, 0)",
              },
              ticks: {
                beginAtZero:true,
                fixedStepSize: 1
              }
          }]
        }
      }
  });
  }
}

export { initChart };
