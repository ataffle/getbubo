import Chart from "chart.js"

const myPieChart = () => {
  const ctx = document.getElementById("total-amount").getContext('2d');
  const total_amount = ctx.canvas.dataset.amount
  // console.log(total_amount);
  // console.log(typeof(total_amount));
  // total_amount.forEach((x) => {
  //   console.log(x)
  // });
  // const p_invoices = total_amount.filter(function(x) { return x === "Pending invoice" })
  // console.log(invoices)
  // const payments = statuses.filter(function(x) { return x === "Pending payment" }).length
  // console.log(payments)
  // const paid = statuses.filter(function(x) { return x === "Paid" }).length
  // console.log(paid)
  const amount = new Chart(ctx,{
      type: 'pie',
      data: {
          labels: ["Pending Invoice", "Pending Payment", "Paid"],
          datasets: [{
              label: '# of Commitments',
              data: [3, 3, 7],
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
      }
  });
};

export { myPieChart };

