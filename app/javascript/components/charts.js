import Chart from "chart.js"

const initChart = () => {
  const ctx = document.getElementById("commitments-statuses").getContext('2d');
  //console.log(ctx)
  //console.log(ctx.canvas.dataset.statuses)
  const statuses = JSON.parse(ctx.canvas.dataset.statuses);
  console.log(ctx.canvas.dataset);
  console.log(typeof statuses);
  const invoices = statuses.filter(function(x) { return x === "Pending invoice" }).length
  const payments = statuses.filter(function(x) { return x === "Pending payment" }).length
  const paid = statuses.filter(function(x) { return x === "Paid" }).length
  const myChart = new Chart(ctx, {
      type: 'bar',
      data: {
          labels: ["Pending Invoice", "Pending Payment", "Paid"],
          datasets: [{
              label: '# of Commitments',
              data: [invoices, payments, paid],
              backgroundColor: [
                  'rgba(255, 99, 132, 0.2)',
                  'rgba(54, 162, 235, 0.2)',
                  'rgba(255, 206, 86, 0.2)',
              ],
              borderColor: [
                  'rgba(255,99,132,1)',
                  'rgba(54, 162, 235, 1)',
                  'rgba(255, 206, 86, 1)',
              ],
              borderWidth: 1
          }]
      },
      options: {
          scales: {
              yAxes: [{
                  ticks: {
                      beginAtZero:true
                  }
              }]
          }
      }
  });
}

export { initChart };
