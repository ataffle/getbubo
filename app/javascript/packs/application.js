import "bootstrap";
import 'select2/dist/css/select2.css';
import { initSelect2 } from '../components/init_select2';
import { modalSupplier } from '../components/init_modal';
import { initChart } from '../components/charts';
import { initLine } from '../components/line';
import { myPieChart } from '../components/pie';
import { sidebar } from '../components/sidebar_not_logged';
import { sidebarStr } from '../components/sidebar_streched';
import "../components/init_flatpickr"
import "../components/datatables"
import "../components/init_active"
import "../components/sidebar_not_logged"
import "../components/sidebar_streched"


initSelect2();
modalSupplier();
initChart();
initLine();
myPieChart();
sidebar();
sidebarStr();
