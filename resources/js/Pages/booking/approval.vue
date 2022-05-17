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
                                <button
                                    type="button"
                                    class="btn btn-icon btn-sm btn-active-light-primary w-30px h-30px me-3"
                                    @click="_cancel(row)"
                                >
                                    <span class="svg-icon svg-icon-3">
                                        <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            width="16"
                                            height="16"
                                            fill="red"
                                            class="bi bi-trash2"
                                            viewBox="0 0 16 16"
                                        >
                                            <path
                                                d="M14 3a.702.702 0 0 1-.037.225l-1.684 10.104A2 2 0 0 1 10.305 15H5.694a2 2 0 0 1-1.973-1.671L2.037 3.225A.703.703 0 0 1 2 3c0-1.105 2.686-2 6-2s6 .895 6 2zM3.215 4.207l1.493 8.957a1 1 0 0 0 .986.836h4.612a1 1 0 0 0 .986-.836l1.493-8.957C11.69 4.689 9.954 5 8 5c-1.954 0-3.69-.311-4.785-.793z"
                                            />
                                        </svg>
                                    </span>
                                </button>
                                <button
                                    type="button"
                                    class="btn btn-icon btn-sm btn-active-light-primary w-30px h-30px me-3"
                                    @click="_approve(row)"
                                >
                                    <span class="svg-icon svg-icon-2">
                                        <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            width="16"
                                            height="16"
                                            fill="lime"
                                            class="bi bi-check-lg"
                                            viewBox="0 0 16 16"
                                        >
                                            <path
                                                d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425a.247.247 0 0 1 .02-.022Z"
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
                route("approval"),
                { faktur: val },
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
        _approve(row) {
            Swal.fire({
                title: "Approve " + row.order_code,
                html: "Apakah anda ingin approve booking ini ? </br> maka akan berlaku mulai sekarang hingga 1 (satu) bulan kedepan",
                showCancelButton: true,
                confirmButtonColor: "green",
                cancelButtonColor: "maroon",
                confirmButtonText: "Ya, Approve Faktur ini",
                reverseButtons: true,
            }).then((result) => {
                if (result.value) {
                    this.$inertia.post(
                        route("approve"),
                        {
                            id: row.id,
                        },
                        {
                            preserveScroll: true,
                            onSuccess: (success) => {
                                console.log(success);
                                Toast.fire({
                                    icon: "success",
                                    title: "Berhasil dihapus",
                                });
                            },
                            onError: (error) => {
                                Toast.fire({
                                    icon: "Ooops",
                                    title: "somethin wrong!",
                                });
                            },
                        }
                    );
                }
            });
        },
        _cancel(row) {
            Swal.fire({
                title: "Cancel " + row.order_code,
                html: "Apakah anda ingin cancel booking ini ?",
                showCancelButton: true,
                confirmButtonColor: "marron",
                // cancelButtonColor: "maroon",
                confirmButtonText: "Ya, Cancel",
                reverseButtons: true,
            }).then((result) => {
                if (result.value) {
                    this.$inertia.post(
                        route("cancelOrder"),
                        {
                            id: row.id,
                        },
                        {
                            preserveScroll: true,
                            onSuccess: (success) => {
                                console.log(success);
                                Toast.fire({
                                    icon: "success",
                                    title: "Berhasil disetujui",
                                });
                            },
                            onError: (error) => {
                                Toast.fire({
                                    icon: "Ooops",
                                    title: "somethin wrong!",
                                });
                            },
                        }
                    );
                }
            });
        },
    },
};
</script>
