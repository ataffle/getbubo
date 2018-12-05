import Chart from "chart.js"

const myPieChart = () => {
  const ctx = document.getElementById("total-amount").getContext('2d');
  const paid_amount = JSON.parse(ctx.canvas.dataset.paid);
  const total_paid = []
  paid_amount.forEach((x) => {
    total_paid.push(x.amount);
  });
  let sum1 = 0;
  for (let i = 0; i < total_paid.length; i++) {
   sum1 += total_paid[i]
  }
  // console.log(sum1);

  const payment_amount = JSON.parse(ctx.canvas.dataset.payment);
  console.log(payment_amount);
  const total_payment = []
  payment_amount.forEach((x) => {
    total_payment.push(x.amount);
  });
  let sum2 = 0;
  for (let i = 0; i < total_payment.length; i++) {
   sum2 += total_payment[i]
  }
  // console.log(sum2);

  const invoice_amount = JSON.parse(ctx.canvas.dataset.invoice);
  console.log(invoice_amount);
  const total_invoice = []
  invoice_amount.forEach((x) => {
    total_invoice.push(x.amount);
  });
  let sum3 = 0;
  for (let i = 0; i < total_invoice.length; i++) {
   sum3 += total_invoice[i]
  }
  // console.log(sum3);

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

