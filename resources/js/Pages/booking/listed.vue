<template>
    <div class="card mb-6 mb-xl-9">
        <div class="card-header border-0 pt-6">
            <div class="card-title">
                <h1
                    class="d-flex align-items-center text-dark fw-bolder fs-3 my-1"
                >
                    {{ name }}
                </h1>
                <span class="h-20px border-gray-200 border-start mx-4"></span>
                <div class="d-flex align-items-center position-relative my-1">
                    <span class="svg-icon svg-icon-1 position-absolute ms-6">
                        <svg
                            xmlns="http://www.w3.org/2000/svg"
                            width="24"
                            height="24"
                            viewBox="0 0 24 24"
                            fill="none"
                        >
                            <rect
                                opacity="0.5"
                                x="17.0365"
                                y="15.1223"
                                width="8.15546"
                                height="2"
                                rx="1"
                                transform="rotate(45 17.0365 15.1223)"
                                fill="black"
                            />
                            <path
                                d="M11 19C6.55556 19 3 15.4444 3 11C3 6.55556 6.55556 3 11 3C15.4444 3 19 6.55556 19 11C19 15.4444 15.4444 19 11 19ZM11 5C7.53333 5 5 7.53333 5 11C5 14.4667 7.53333 17 11 17C14.4667 17 17 14.4667 17 11C17 7.53333 14.4667 5 11 5Z"
                                fill="black"
                            />
                        </svg>
                    </span>
                    <!--end::Svg Icon-->
                    <input
                        type="text"
                        data-kt-customer-table-filter="search"
                        class="form-control form-control-solid w-250px ps-15"
                        placeholder="Search By Nomor Faktur"
                        @input="_search($event.target.value)"
                    />
                </div>
                <!--end::Search-->
            </div>
            <!--begin::Card title-->
            <!--begin::Card toolbar-->
            <div class="card-toolbar">
                <!--begin::Toolbar-->
                <div class="d-flex">
                    <Link
                        :href="route('rule.create')"
                        type="button"
                        class="btn btn-light-primary btn-sm"
                    >
                        <!--begin::Svg Icon | path: icons/duotune/files/fil005.svg-->
                        <span class="svg-icon svg-icon-3">
                            <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="24"
                                height="24"
                                viewBox="0 0 24 24"
                                fill="none"
                            >
                                <path
                                    opacity="0.3"
                                    d="M19 22H5C4.4 22 4 21.6 4 21V3C4 2.4 4.4 2 5 2H14L20 8V21C20 21.6 19.6 22 19 22ZM16 13H13V10C13 9.4 12.6 9 12 9C11.4 9 11 9.4 11 10V13H8C7.4 13 7 13.4 7 14C7 14.6 7.4 15 8 15H11V18C11 18.6 11.4 19 12 19C12.6 19 13 18.6 13 18V15H16C16.6 15 17 14.6 17 14C17 13.4 16.6 13 16 13Z"
                                    fill="black"
                                ></path>
                                <path
                                    d="M15 8H20L14 2V7C14 7.6 14.4 8 15 8Z"
                                    fill="black"
                                ></path>
                            </svg>
                        </span>
                        Add {{ name }}
                    </Link>
                </div>
            </div>
        </div>

        <div class="card-body">
            <table
                class="table align-middle table-row-dashed fs-6 gy-5"
                id="kt_customers_table"
            >
                <thead>
                    <tr>
                        <th class="min-w-50px">Status</th>
                        <th class="min-w-75px">Faktur</th>
                        <th class="min-w-100px">Pengguna</th>
                        <th class="min-w-25px">Nomor Room</th>
                        <th class="min-w-100px">Rincian</th>
                        <th class="min-w-100px">Biaya</th>
                        <th class="min-w-50px"></th>
                    </tr>
                </thead>
                <tbody class="fw-bold text-gray-600">
                    <tr v-for="row in bookings.data" :key="row.id">
                        <td>
                            <div v-html="row.statusSpan"></div>
                        </td>
                        <td>
                            {{ row.order_code }}
                        </td>
                        <td>
                            {{ row.user.nama }}
                        </td>
                        <td>
                            {{ row.room.nomor_room }}
                        </td>
                        <td>
                            Tgl Pemesanan : {{ row.created_at }}
                            <hr />
                            <div v-if="row.start_at == null">
                                Tgl mulai sewa : Belum ditetapkan
                            </div>
                            <div v-else>
                                Tgl mulai sewa : {{ row.start_at }}
                            </div>
                            <div v-if="row.end_at == null">
                                Tgl sewa berakhir : Belum ditetapkan
                            </div>
                            <div v-else>
                                Tgl sewa berakhir : {{ row.end_at }}
                            </div>
                            <hr />
                            <b>APPROVED BY : </b> {{ row.admin.nama }}
                        </td>
                        <td>
                            {{ $filters.currency(row.price) }}
                        </td>
                        <td class="text-end">
                            <div
                                class="btn-group btn-group-sm"
                                role="group"
                                aria-label="Basic example"
                            >
                                <button
                                    type="button"
                                    class="btn btn-icon btn-sm btn-active-light-primary w-30px h-30px me-3"
                                    @click="_img(row)"
                                >
                                    <span class="svg-icon svg-icon-3">
                                        <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            width="16"
                                            height="16"
                                            fill="lightblue"
                                            class="bi bi-info-circle-fill"
                                            viewBox="0 0 16 16"
                                        >
                                            <path
                                                d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"
                                            />
                                        </svg>
                                    </span>
                                </button>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div
                class="modal-footer flex-center"
                v-if="bookings.data.length < 1"
            >
                {{ name }} tidak ditemukan
            </div>
            <pagination
                class="mt-6 dataTables_paginate paging_simple_numbers"
                :links="bookings.links"
            />
            <!--end::Table-->
        </div>
    </div>
    <!-- modal -->
    <div class="modal fade" id="modal_detail" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-fullscreen p-10">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">
                        BUKTI TRANSFER FAKTUR NO : {{ data_modal.order_code }}
                    </h5>

                    <!--begin::Close-->
                    <div
                        class="btn btn-icon btn-sm btn-active-light-primary ms-2"
                        data-bs-dismiss="modal"
                        aria-label="Close"
                    >
                        <span class="svg-icon svg-icon-2x"></span>
                    </div>
                    <!--end::Close-->
                </div>
                <div class="modal-body">
                    <img
                        :src="data_modal.bukti_tf"
                        class="img-responsive"
                        style="max-width: 1200px !important"
                    />
                </div>
            </div>
        </div>
    </div>
    <!-- end modal -->
</template>
<script>
import LayoutApp from "@/Layouts/Admin.vue";
import { Head, Link } from "@inertiajs/inertia-vue3";
import Pagination from "@/Components/Pagination";
import VueSelect from "vue-select";
export default {
    layout: LayoutApp,
    components: {
        Head,
        Link,
        Pagination,
        VueSelect,
    },
    props: {
        name: String,
        bookings: Object,
    },
    data() {
        return {
            url: null,
            data_modal: {
                nama: "",
                nik: "",
            },
        };
    },
    created() {},
    methods: {
        _search(val) {
            this.$inertia.get(
                route("rule.index"),
                { desc: val },
                {
                    preserveScroll: true,
                    preserveState: true,
                    onSuccess: (success) => {},
                    onError: (error) => {},
                }
            );
        },
        _img(row) {
            this.data_modal.bukti_tf = "/storage/" + row.bukti_tf;
            this.data_modal.order_code = row.order_code;
            $("#modal_detail").modal("show");
        },
    },
};
</script>
