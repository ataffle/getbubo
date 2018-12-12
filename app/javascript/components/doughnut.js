import Chart from "chart.js"

const initDoughnut = () => {
  let ctx = document.getElementById("commitments-statuses")
  if (ctx) {

  ctx = ctx.getContext('2d');

  // console.log(ctx.canvas.dataset.invoice)
  const invoices_group = JSON.parse(ctx.canvas.dataset.invoice);
  console.log(invoices_group);
  const payments_group = JSON.parse(ctx.canvas.dataset.payment);
  console.log(payments_group);
  const paid_group = JSON.parse(ctx.canvas.dataset.paid);
  console.log(paid_group);
  // console.log(statuses);
  // console.log(typeof statuses);
  const invoices = invoices_group.length
  const payments = payments_group.length
  const paid = paid_group.length
  const repartition = `<div>${(invoices + payments)}</div><div>hello</div>`
  const test = 'test'
  const myChart = new Chart(ctx, {
      type: 'doughnut',
      data: {
          labels: ["Facture en attente", "Paiement en attente", "Payé"],
          datasets: [{
              label: "Nombre de factures",
              data: [invoices, payments, paid],
              backgroundColor: [
                  'rgba(0, 102, 150, 1)',
                  'rgba(238, 135, 136, 1)',
                  'rgba(113, 229, 138, 1)',
              ],
              borderColor: [
                  'rgba(0, 102, 150, 1)',
                  'rgba(238, 135, 136, 1)',
                  'rgba(113, 229, 138, 1)',
              ],
              borderWidth: 1
          }]
      },
      options: {
        cutoutPercentage: 90,
        rotation: 1 * Math.PI,
        circumference: 1 * Math.PI,
        legend: {
          display: false
        },
        layout: {
         padding: {
             left: 32,
             right: 45,
             top: 32,
             bottom: 32
           }
         },
        scales: {
          xAxes: [{
              gridLines: {
                zeroLineColor: "transparent",
              },
                display: false
          }],
          yAxes: [{
              gridLines: {
                  color: "rgba(0, 0, 0, 0)",
              },
              ticks: {
                beginAtZero:true,
                display: false,
              }
          }]
        }
      }
  });
  }
}

export { initDoughnut };
