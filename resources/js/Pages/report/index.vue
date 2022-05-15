<template>
    <h1>Report</h1>
    <div class="card mb-6 mb-xl-9">
        <div class="d-flex flex-column flex-md-row rounded border p-10">
            <ul
                class="nav nav-tabs nav-pills flex-row border-0 flex-md-column me-5 mb-3 mb-md-0 fs-6"
            >
                <li class="nav-item me-0 mb-md-2">
                    <a
                        class="nav-link btn btn-flex btn-active-light-info"
                        data-bs-toggle="tab"
                        href="#kt_vtab_pane_4"
                    >
                        <!--begin::Svg Icon | path: icons/duotune/general/gen001.svg-->
                        <span class="svg-icon svg-icon-2 svg-icon-primary me-3">
                            <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="16"
                                height="16"
                                fill="currentColor"
                                class="bi bi-grid-3x2-gap"
                                viewBox="0 0 16 16"
                            >
                                <path
                                    d="M4 4v2H2V4h2zm1 7V9a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v2a1 1 0 0 0 1 1h2a1 1 0 0 0 1-1zm0-5V4a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v2a1 1 0 0 0 1 1h2a1 1 0 0 0 1-1zm5 5V9a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1v2a1 1 0 0 0 1 1h2a1 1 0 0 0 1-1zm0-5V4a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1v2a1 1 0 0 0 1 1h2a1 1 0 0 0 1-1zM9 4v2H7V4h2zm5 0h-2v2h2V4zM4 9v2H2V9h2zm5 0v2H7V9h2zm5 0v2h-2V9h2zm-3-5a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1V4zm1 4a1 1 0 0 0-1 1v2a1 1 0 0 0 1 1h2a1 1 0 0 0 1-1V9a1 1 0 0 0-1-1h-2z"
                                />
                            </svg>
                        </span>
                        <!--end::Svg Icon-->
                        <span class="d-flex flex-column align-items-start">
                            <span class="fs-4 fw-bolder">SEWA & Keuangan</span>
                        </span>
                    </a>
                </li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade" id="kt_vtab_pane_4" role="tabpanel">
                    <div class="row">
                        <div class="col-md-5 fv-row fv-plugins-icon-container">
                            <label class="required fs-5 fw-bold mb-2"
                                >Dari</label
                            >
                            <input
                                type="date"
                                class="form-control form-control-solid"
                                placeholder=""
                                v-model="form.start_at"
                                required
                            />
                        </div>
                        <div class="col-md-5 fv-row fv-plugins-icon-container">
                            <label class="required fs-5 fw-bold mb-2"
                                >Sampai</label
                            >
                            <input
                                type="date"
                                class="form-control form-control-solid"
                                placeholder=""
                                v-model="form.end_at"
                                required
                            />
                        </div>
                        <div class="col-md-2 fv-row fv-plugins-icon-container">
                            <label class="fs-5 fw-bold mb-2">&nbsp;</label>
                            <form :action="route('getReport')" target="_blank">
                                <input
                                    type="hidden"
                                    name="start_at"
                                    :value="form.start_at"
                                />
                                <input
                                    type="hidden"
                                    name="end_at"
                                    :value="form.end_at"
                                />
                                <input
                                    type="submit"
                                    class="btn btn-dark me-3"
                                />
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
import LayoutApp from "@/Layouts/Admin.vue";
import { Head, Link } from "@inertiajs/inertia-vue3";
export default {
    layout: LayoutApp,
    components: {
        Head,
        Link,
    },
    props: {},
    data() {
        return {
            form: {
                start_at: null,
                end_at: null,
            },
        };
    },
    created() {},
    methods: {
        _download() {
            // window.open(route("getReport"), '_blank');
            // axios
            //     .get(route("getReport"), {
            //         start_at: this.form.start_at,
            //         end_at: this.form.end_at,
            //     })
            //     // axios({
            //     //     url: route("getReport"),
            //     //     method: "GET",
            //     //     responseType: "blob", // important
            //     // }).
            //     .then((response) => {
            //         const url = window.URL.createObjectURL(
            //             new Blob([response.data])
            //         );
            //         const link = document.createElement("a");
            //         link.href = url;
            //         link.setAttribute("download", "report-sewa.pdf");
            //         document.body.appendChild(link);
            //         link.click();
            //     });
        },
    },
};
</script>
