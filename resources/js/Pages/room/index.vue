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
                        placeholder="Search By Peraturan"
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
                        :href="route('room.create')"
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
                        <th class="min-w-5px">No Room</th>
                        <th class="min-w-5px">Lantai</th>
                        <th class="min-w-125px">Tipe</th>
                        <th class="min-w-150px">Harga</th>
                        <th class="min-w-100px">Tersedia</th>
                        <th class="min-w-50px"></th>
                    </tr>
                </thead>
                <tbody class="fw-bold text-gray-600">
                    <tr v-for="(row, i) in rooms.data" :key="row.id">
                        <td>
                            {{ row.nomor_room }}
                        </td>
                        <td>
                            {{ row.lantai }}
                        </td>
                        <td>
                            {{ row.tipe_room.desc }}
                        </td>
                        <td>
                            {{ $filters.currency(row.price) }}
                        </td>
                        <td>
                            <div v-html="row.tersedia.span">                                
                            </div>
                        </td>
                        <td class="text-end">
                            <div
                                class="btn-group btn-group-sm"
                                role="group"
                                aria-label="Basic example"
                            >
                                <Link
                                    :href="route('room.show', row.id)"
                                    class="btn btn-icon btn-sm btn-active-light-primary w-30px h-30px me-3"
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
                                </Link>
                                <Link
                                    :href="route('room.edit', row.id)"
                                    type="button"
                                    class="btn btn-icon btn-sm btn-active-light-primary w-30px h-30px me-3"
                                >
                                    <span class="svg-icon svg-icon-3">
                                        <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            width="16"
                                            height="16"
                                            fill="orange"
                                            class="bi bi-pen"
                                            viewBox="0 0 16 16"
                                        >
                                            <path
                                                d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001zm-.644.766a.5.5 0 0 0-.707 0L1.95 11.756l-.764 3.057 3.057-.764L14.44 3.854a.5.5 0 0 0 0-.708l-1.585-1.585z"
                                            />
                                        </svg>
                                    </span>
                                </Link>
                                <button
                                    type="button"
                                    class="btn btn-icon btn-sm btn-active-light-primary w-30px h-30px me-3"
                                    @click="_remove(row.id)"
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
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="modal-footer flex-center" v-if="rooms.data.length < 1">
                {{ name }} tidak ditemukan
            </div>
            <pagination
                class="mt-6 dataTables_paginate paging_simple_numbers"
                :links="rooms.links"
            />
            <!--end::Table-->
        </div>
        <!--end::Card body-->
    </div>
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
        rooms: Object,
    },
    data() {
        return {
            search: "",
            edit: false,
            formLoading: false,
        };
    },
    created() {},
    methods: {
        _search(val) {
            this.$inertia.get(
                route("room.index"),
                { desc: val },
                {
                    preserveScroll: true,
                    preserveState: true,
                    onSuccess: (success) => {},
                    onError: (error) => {},
                }
            );
        },
        _remove(id) {
            Swal.fire({
                title: "Konfirmasi",
                text: "Apakah anda ingin menghapus data ini ?",
                showCancelButton: true,
                // confirmButtonColor: "lightblue",
                // cancelButtonColor: "red",
                confirmButtonText: "Ya, Saya yakin !",
                reverseButtons: true,
            }).then((result) => {
                if (result.value) {
                    this.$inertia.delete(route("room.destroy", id), {
                        preserveScroll: true,
                        onSuccess: (success) => {
                            // alert('a');
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
                    });
                }
            });
        },
    },
};
</script>
