// Import and register all your controllers from the importmap under controllers/*

import { application } from "./application";

import Ts__SelectSingleController from "./ts/select_single_controller"
application.register("ts--select-single", Ts__SelectSingleController)
