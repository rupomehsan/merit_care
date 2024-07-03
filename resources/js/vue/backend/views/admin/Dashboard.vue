<template>
  <section class="p-5 custom_scroll" style="overflow-y: auto !important; height: calc(100vh - 100px);">
    <div class="row">
      <div class="col-xl-12 mb-1 col-lg-12 col-12">
        <div class="card">
          <div class="mx-2 mt-1 mb-2">
            <div class="row">
              <div class="col-md-5">
                <label for="month">From Date</label>
                <input type="date" class="form-control" name="from_date" v-model="from_date" id="from_date" />
              </div>
              <div class="col-md-5">
                <label for="month">To Date</label>
                <input type="date" class="form-control" name="to_date" v-model="to_date" id="to_date" />
              </div>
              <div class="col-md-2">
                <div class="filter_btn mt-2">
                  <button @click.prevent="filter_stats_by_month()" class="btn btn-sm btn-primary">Filter</button>
                </div>
              </div>
            </div>
          </div>

          <!-- <div v-if="get_dashboard_stats" class="card-body">
            <div class="row gy-3">
              <div class="col-md-3 col-6">
                <div class="d-flex align-items-center">
                  <div class="badge rounded-pill bg-label-primary me-3 p-2">
                    <i class="fa-solid fa-chart-pie"></i>
                  </div>
                  <div class="card-info">
                    <h5 class="mb-0">{{ get_dashboard_stats.total_orders }}</h5>
                    <small>Total Orders</small>
                  </div>
                </div>
              </div>
              <div class="col-md-3 col-6">
                <div class="d-flex align-items-center">
                  <div class="badge rounded-pill bg-label-info me-3 p-2">
                    <i class="fa-solid fa-user-group"></i>
                  </div>
                  <div class="card-info">
                    <h5 class="mb-0">{{ get_dashboard_stats.total_customers }}</h5>
                    <small>Customers</small>
                  </div>
                </div>
              </div>
              <div class="col-md-3 col-6">
                <div class="d-flex align-items-center">
                  <div class="badge rounded-pill bg-label-danger me-3 p-2">
                    <i class="fa-solid fa-cart-shopping"></i>
                  </div>
                  <div class="card-info">
                    <h5 class="mb-0">{{ get_dashboard_stats.total_products }}</h5>
                    <small>Products</small>
                  </div>
                </div>
              </div>
              <div class="col-md-3 col-6">
                <div class="d-flex align-items-center">
                  <div class="badge rounded-pill bg-label-success me-3 p-2">
                    <i class="fa-solid fa-money-bills"></i>
                  </div>
                  <div class="card-info">
                    <h5 class="mb-0">{{ get_dashboard_stats.total_income }}</h5>
                    <small>Total Income</small>
                  </div>
                </div>
              </div>

              <div class="col-md-3 col-6">
                <div class="d-flex align-items-center">
                  <div class="badge rounded-pill bg-label-primary me-3 p-2">
                    <i class="fa-solid fa-shop-lock"></i>
                  </div>
                  <div class="card-info">
                    <h5 class="mb-0">{{ get_dashboard_stats.total_batch }}</h5>
                    <small>Batch</small>
                  </div>
                </div>
              </div>
              <div class="col-md-3 col-6">
                <div class="d-flex align-items-center">
                  <div class="badge rounded-pill bg-label-info me-3 p-2">
                    <i class="fa-solid fa-graduation-cap"></i>
                  </div>
                  <div class="card-info">
                    <h5 class="mb-0">{{ get_dashboard_stats.total_students }}</h5>
                    <small>Total Students</small>
                  </div>
                </div>
              </div>
              <div class="col-md-3 col-6">
                <div class="d-flex align-items-center">
                  <div class="badge rounded-pill bg-label-danger me-3 p-2">
                    <i class="fa-solid fa-user-tie"></i>
                  </div>
                  <div class="card-info">
                    <h5 class="mb-0">{{ get_dashboard_stats.total_teachers }}</h5>
                    <small>Total teachers</small>
                  </div>
                </div>
              </div>
              <div class="col-md-3 col-6">
                <div class="d-flex align-items-center">
                  <div class="badge rounded-pill bg-label-success me-3 p-2">
                    <i class="fa-solid fa-money-bills"></i>
                  </div>
                  <div class="card-info">
                    <h5 class="mb-0">{{ get_dashboard_stats.total_expense }}</h5>
                    <small>Total expense</small>
                  </div>
                </div>
              </div>
            </div>
          </div> -->

        </div>
      </div>

      <div class="row" v-if="get_dashboard_stats">
        <div class="col-xl-2 col-md-4 col-6 mb-4">
          <div class="card">
            <div class="card-body">
              <div class="d-flex justify-content-center">
                <div class="badge p-2 bg-label-success mb-2 rounded"><i class="fas fa-chalkboard-teacher fa-5x"></i></div>
              </div>
              <h5 class="card-title mb-1 pt-2 text-center">Total Batch</h5>
              <h3 class="mb-1 mt-1 text-center">{{ get_dashboard_stats.total_batch }}</h3>
            </div>
          </div>
        </div>
        <div class="col-xl-2 col-md-4 col-6 mb-4">
          <div class="card">
            <div class="card-body">
              <div class="d-flex justify-content-center">
                <div class="badge p-2 bg-label-secondary mb-2 rounded"><i class="fas fa-users fa-5x"></i></div>
              </div>
              <h5 class="card-title mb-1 pt-2 text-center">Total Employee</h5>
              <h3 class="mb-1 mt-1 text-center">{{ get_dashboard_stats.total_employees }}</h3>
            </div>
          </div>
        </div>
        <div class="col-xl-2 col-md-4 col-6 mb-4">
          <div class="card">
            <div class="card-body">
              <div class="d-flex justify-content-center">
                <div class="badge p-2 bg-label-info mb-2 rounded"><i class="fas fa-user-graduate fa-5x"></i></div>
              </div>
              <h5 class="card-title mb-1 pt-2 text-center">Total Students</h5>
              <h3 class="mb-1 mt-1 text-center">{{ get_dashboard_stats.total_students }}</h3>
            </div>
          </div>
        </div>
        <div class="col-xl-2 col-md-4 col-6 mb-4">
          <div class="card">
            <div class="card-body">
              <div class="d-flex justify-content-center">
                <div class="badge p-2 bg-label-primary mb-2 rounded"><i class="fas fa-users fa-5x"></i></div>
              </div>
              <h5 class="card-title mb-1 pt-2 text-center">Total Teacher</h5>
              <h3 class="mb-1 mt-1 text-center">{{ get_dashboard_stats.total_teachers }}</h3>
            </div>
          </div>
        </div>
        <div class="col-xl-2 col-md-4 col-6 mb-4">
          <div class="card">
            <div class="card-body">
              <div class="d-flex justify-content-center">
                <div class="badge p-2 bg-label-warning mb-2 rounded"><i class="fas fa-shopping-cart fa-5x"></i></div>
              </div>
              <h5 class="card-title mb-1 pt-2 text-center">Total Products</h5>
              <h3 class="mb-1 mt-1 text-center">{{ get_dashboard_stats.total_products }}</h3>
            </div>
          </div>
        </div>
        <div class="col-xl-2 col-md-4 col-6 mb-4">
          <div class="card">
            <div class="card-body">
              <div class="d-flex justify-content-center">
                <div class="badge p-2 bg-label-danger mb-2 rounded"><i class="fas fa-user-tag fa-5x"></i></div>
              </div>
              <h5 class="card-title mb-1 pt-2 text-center">Total Customer</h5>
              <h3 class="mb-1 mt-1 text-center">{{ get_dashboard_stats.total_customers }}</h3>
            </div>
          </div>
        </div>
      </div>

      <div v-if="loaded" class="col-xl-6 mb-4 col-lg-6 col-6 col-md-6">
        <div class="card h-100">
          <div class="card-header">
            <div class="d-flex justify-content-between mb-3">
              <h5 class="card-title mb-0">Total monthly order value</h5>
              <!-- <small class="text-muted">Updated 1 month ago</small> -->
            </div>
          </div>
          <div class="card-body">
            <div class="row gy-3">
              <Bar :options="chartOptions" :data="chartData" />
            </div>
          </div>
        </div>
      </div>

      <div v-if="loaded" class="col-xl-6 mb-4 col-lg-6 col-6 col-md-6">
        <div class="card h-100">
          <div class="card-header">
            <div class="d-flex justify-content-between mb-3">
              <h5 class="card-title mb-0">Total monthly income</h5>
              <!-- <small class="text-muted">Updated 1 month ago</small> -->
            </div>
          </div>
          <div class="card-body">
            <div class="row gy-3">
              <LineChart id="line-chart" :options="LinechartOptions" :data="LinechartData" />
            </div>
          </div>
        </div>
      </div>
    </div>

  </section>
</template>

<script>
import { mapActions, mapGetters } from "vuex";
import { Bar, Line as LineChart } from "vue-chartjs";
import {
  Chart as ChartJS,
  Title,
  Tooltip,
  Legend,
  BarElement,
  CategoryScale,
  LineElement,
  LinearScale,
  PointElement
} from "chart.js";

ChartJS.register(
  Title,
  Tooltip,
  Legend,
  BarElement,
  CategoryScale,
  LineElement,
  LinearScale,
  PointElement
);

export default {
  components: { Bar, LineChart },
  data() {
    return {
      chartData: {
        labels: [],
        datasets: [
          {
            data: [],
            backgroundColor: "#695fd7",
            label: "Monthly Orders"
          }
        ]
      },
      from_date: "",
      to_date: "",
      loaded: false,
      months: [
        "January",
        "February",
        "March",
        "April",
        "May",
        "June",
        "July",
        "August",
        "September",
        "October",
        "November",
        "December"
      ],
      LinechartData: {
        labels: [],
        datasets: [
          {
            label: "Monthly income",
            backgroundColor: "#07b8d0",
            borderColor: "#07b8d0",
            data: []
          }
        ]
      },
      LinechartOptions: {
        responsive: true,
        maintainAspectRatio: false
      },
      chartOptions: {
        responsive: true
      }
    };
  },
  created: function () {
    // let that = this
    // setTimeout(() => {

    //     that.loaded = true;
    // }, 500);

    this.fetch_dashboard_stats();
  },
  methods: {
    ...mapActions([`fetch_dashboard_stats`, `fetch_dashboard_stats_by_month`]),
    filter_stats_by_month: function (event) {
      let date = {
        from_date: this.from_date,
        to_date: this.to_date
      };
      this.fetch_dashboard_stats_by_month(date);
    }
  },
  computed: {
    ...mapGetters([`get_dashboard_stats`])
  },
  watch: {
    get_dashboard_stats: {
      handler: function (newv, oldv) {
        this.chartData.datasets[0]["data"] = newv.order_totals;
        this.chartData.labels = newv.month_name;
        this.LinechartData.labels = newv.month_name;
        this.LinechartData.datasets[0]["data"] = newv.monthly_income;

        let that = this;
        that.loaded = true;
      },
      deep: true
    }
  }
};
</script>

<style>
.badge {
  --bs-badge-padding-x: 1em;
  --bs-badge-padding-y: 0.49em;
  --bs-badge-font-size: 0.81em;
  --bs-badge-font-weight: 600;
  --bs-badge-color: #fff;
  --bs-badge-border-radius: 0.25rem;
  display: inline-block;
  padding: var(--bs-badge-padding-y) var(--bs-badge-padding-x);
  font-size: var(--bs-badge-font-size);
  font-weight: var(--bs-badge-font-weight);
  line-height: 1;
  color: var(--bs-badge-color);
  text-align: center;
  white-space: nowrap;
  vertical-align: baseline;
  border-radius: var(--bs-badge-border-radius);
}

.badge:empty {
  display: none;
}

.btn .badge {
  position: relative;
  top: -1px;
}

.rounded-circle {
  border-radius: 50% !important;
}

.rounded-pill {
  border-radius: 50rem !important;
}

.rounded-top {
  border-top-left-radius: 0.375rem !important;
  border-top-right-radius: 0.375rem !important;
}

.rounded-bottom {
  border-bottom-right-radius: 0.375rem !important;
  border-bottom-left-radius: 0.375rem !important;
}

.row-bordered.row-border-light>.col::before,
.row-bordered.row-border-light>.col::after,
.row-bordered.row-border-light>[class^="col-"]::before,
.row-bordered.row-border-light>[class^="col-"]::after,
.row-bordered.row-border-light>[class*=" col-"]::before,
.row-bordered.row-border-light>[class*=" col-"]::after,
.row-bordered.row-border-light>[class^="col "]::before,
.row-bordered.row-border-light>[class^="col "]::after,
.row-bordered.row-border-light>[class*=" col "]::before,
.row-bordered.row-border-light>[class*=" col "]::after,
.row-bordered.row-border-light>[class$=" col"]::before,
.row-bordered.row-border-light>[class$=" col"]::after,
.row-bordered.row-border-light>[class="col"]::before,
.row-bordered.row-border-light>[class="col"]::after {
  border-color: rgba(255, 255, 255, 0.8);
}

[dir="rtl"] .row-bordered>.col::after,
[dir="rtl"] .row-bordered>[class^="col-"]::after,
[dir="rtl"] .row-bordered>[class*=" col-"]::after,
[dir="rtl"] .row-bordered>[class^="col "]::after,
[dir="rtl"] .row-bordered>[class*=" col "]::after,
[dir="rtl"] .row-bordered>[class$=" col"]::after,
[dir="rtl"] .row-bordered>[class="col"]::after {
  left: auto;
  right: -1px;
}

.bg-label-secondary {
  background-color: #424659 !important;
  color: #a8aaae !important;
}

.bg-label-success {
  background-color: #2e4b4f !important;
  color: #28c76f !important;
}

.bg-label-info {
  background-color: #274c62 !important;
  color: #00cfe8 !important;
}

.bg-label-warning {
  background-color: #504448 !important;
  color: #ff9f43 !important;
}

.bg-label-danger {
  background-color: #4d384b !important;
  color: #ea5455 !important;
}

.bg-label-light {
  background-color: #32364c !important;
  color: #44475b !important;
}

.bg-label-dark {
  background-color: #4a4d61 !important;
  color: #d7d8de !important;
}

.bg-label-gray {
  background-color: rgba(70, 74, 94, 0.968) !important;
  color: rgba(255, 255, 255, 0.8) !important;
}

.bg-dark {
  color: #fff;
  background-color: #44475b !important;
}

.bg-label-dark {
  background-color: #32364c !important;
  color: #44475b !important;
}

a.bg-dark:hover,
a.bg-dark:focus {
  background-color: rgba(0, 0, 0, 0.65) !important;
}

a.bg-light:hover,
a.bg-light:focus {
  background-color: rgba(255, 255, 255, 0.6) !important;
}

a.bg-lighter:hover,
a.bg-lighter:focus {
  background-color: rgba(255, 255, 255, 0.8) !important;
}

a.bg-lightest:hover,
a.bg-lightest:focus {
  background-color: rgba(255, 255, 255, 0.03) !important;
}

.bg-label-primary {
  background-color: #3a3b64 !important;
  color: #7367f0 !important;
}
</style>
