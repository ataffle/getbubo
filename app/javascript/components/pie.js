import Chart from "chart.js"

const myPieChart = () => {

  let ctx = document.getElementById("total-amount")
  if (ctx) {
    ctx = ctx.getContext('2d');

    const paid_amount = JSON.parse(ctx.canvas.dataset.paid);
    const total_paid = []
    paid_amount.forEach((x) => {
      total_paid.push(x.amount);
    });
    let sum1 = 0;
    for (let i = 0; i < total_paid.length; i++) {
     sum1 += total_paid[i]
    }
    const paid = sum1;

    const payment_amount = JSON.parse(ctx.canvas.dataset.payment);
    const total_payment = []
    payment_amount.forEach((x) => {
      total_payment.push(x.amount);
    });
    let sum2 = 0;
    for (let i = 0; i < total_payment.length; i++) {
     sum2 += total_payment[i]
    }
    const pending_payment = sum2;

    const invoice_amount = JSON.parse(ctx.canvas.dataset.invoice);
    const total_invoice = []
    invoice_amount.forEach((x) => {
      total_invoice.push(x.amount);
    });
    let sum3 = 0;
    for (let i = 0; i < total_invoice.length; i++) {
     sum3 += total_invoice[i]
    }
    const pending_invoice = sum3;

    const amount = new Chart(ctx,{
        type: 'pie',
        data: {
            labels: ["Facture en attente", "Paiement en attente", "Payé"],
            datasets: [{
                data: [pending_invoice, pending_payment, paid],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(15, 51, 78, 0.2)',
                    'rgba(64, 190, 194, 0.2)',
                ],
                borderColor: [
                    'rgba(255,99,132,1)',
                    'rgba(15, 51, 78, 1)',
                    'rgba(64, 190, 194, 1)',
                ],
                borderWidth: 1
            }]
        },
        options: {
          layout: {
           padding: {
               left: 32,
               right: 32,
               top: 32,
               bottom: 32
           }
       }
        }
    });
  }
};

export { myPieChart };
