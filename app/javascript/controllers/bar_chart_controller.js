import { Controller } from "stimulus";
import Chart from "chart.js/auto";


export default class extends Controller {

  connect() {
    this.initializeChart();
  }

  initializeChart() {
    const canvas = document.getElementsByClassName('chart');
    const ctx = canvas[0].getContext("2d");
    const dataValue = JSON.parse(canvas[0].getAttribute('data-chart-data-value'));

    const data = {
      labels: Object.keys(dataValue),
      datasets: [
        {
          data: Object.values(dataValue),
          backgroundColor: ["#4bc0c0", "#ff9f40", "#9966ff"],
        },
      ],
    };

    const options = {
      maintainAspectRatio: false,
      responsive: true,
      plugins: {
        legend: {
          display: false
        }
      }
      };

    new Chart(ctx, {
      type: "bar",
      data: data,
      options: options,
    });
  }
}
