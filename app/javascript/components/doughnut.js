import Chart from "chart.js"

const initDoughnut = () => {
  let ctx = document.getElementById("commitments-statuses")
  if (ctx) {
  Chart.pluginService.register({
    beforeDraw: function (chart) {
      if (chart.config.options.elements.center) {
        //Get ctx from string
        const ctx = chart.chart.ctx;

        //Get options from the center object in options
        const centerConfig = chart.config.options.elements.center;
        const fontStyle = centerConfig.fontStyle || 'Arial';
        const txt = centerConfig.text;
        const color = centerConfig.color || '#000';
        const sidePadding = centerConfig.sidePadding || 20;
        const sidePaddingCalculated = (sidePadding/100) * (chart.innerRadius * 2)
        //Start with a base font of 30px
        ctx.font = "30px " + fontStyle;

        //Get the width of the string and also the width of the element minus 10 to give it 5px side padding
        const stringWidth = ctx.measureText(txt).width;
        const elementWidth = (chart.innerRadius * 2) - sidePaddingCalculated;

        // Find out how much the font can grow in width.
        const widthRatio = elementWidth / stringWidth;
        const newFontSize = Math.floor(10 * widthRatio);
        const elementHeight = (chart.innerRadius * 2);

        // Pick a new font size so it will not be larger than the height of label.
        const fontSizeToUse = Math.min(newFontSize, elementHeight);

        //Set font settings to draw it correctly.
        ctx.textAlign = 'center';
        ctx.textBaseline = 'middle';
        const centerX = ((chart.chartArea.left + chart.chartArea.right) / 2);
        const centerY = ((chart.chartArea.top + chart.chartArea.bottom)/ 1.5);
        ctx.font = fontSizeToUse+"px " + fontStyle;
        ctx.fillStyle = color;

        //Draw text in center
        ctx.fillText(txt, centerX, centerY);
      }
    }
  });
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
  const repartition = (invoices + payments)
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
        elements: {
              center: {
              text: [repartition],
              text: [test],
              color: 'rgba(0, 0, 0, 0.8)', //Default black
              fontStyle: 'Helvetica', //Default Arial
              sidePadding: 60 //Default 20 (as a percentage)
            },
          },
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
