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
                        placeholder="Search By Email"
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
                    <button
                        type="button"
                        class="btn btn-light-primary btn-sm"
                        @click="_new"
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
                    </button>
                </div>
            </div>
        </div>

        <div class="card-body">
            <div class="form-group">
                <label for="select2" class="col-sm-3 control-label">
                    A searchable select with names and localized in en-US:
                </label>
                <div class="col-sm-5">
                    <select
                        class="form-select form-select-solid"
                        data-control="select2"
                        data-placeholder="Select an option"
                        data-allow-clear="true"
                        v-model="tes"
                    >
                        <option></option>
                        <option value="1">Option 1</option>
                        <option value="2">Option 2</option>
                        <option value="3">Option 3</option>
                        <option value="4">Option 4</option>
                        <option value="5">Option 5</option>
                        <option value="6">Option 6</option>
                    </select>
                </div>
                <div class="col-sm-4">
                    <p class="form-control-static">
                        Selected Result:
                        <span class="vue-result2">{{ result2 }}</span>
                    </p>
                </div>
            </div>
            <table
                class="table align-middle table-row-dashed fs-6 gy-5"
                id="kt_customers_table"
            >
                <thead>
                    <tr>
                        <th class="min-w-125px">NIK</th>
                        <th class="min-w-125px">Nama</th>
                        <th class="min-w-125px">Email</th>
                        <th class="min-w-50px">Status</th>
                        <th class="min-w-125px">Register Date</th>
                    </tr>
                </thead>
                <tbody class="fw-bold text-gray-600">
                    <tr v-for="row in users.data" :key="row.id">
                        <td>
                            {{ row.nik }}
                        </td>
                        <td>
                            {{ row.nama }}
                        </td>
                        <td>
                            {{ row.email }}
                        </td>
                        <td>
                            <div v-html="row.statusSpan"></div>
                        </td>
                        <td>
                            {{ row.created_at }}
                        </td>
                    </tr>
                </tbody>
            </table>
            <pagination
                class="mt-6 dataTables_paginate paging_simple_numbers"
                :links="users.links"
            />

            <!--end::Table-->
        </div>
        <!--end::Card body-->
    </div>
    <!--end::Card-->
    <!-- </div> -->
    <!--end::Container-->
    <div
        class="modal fade"
        id="kt_modal_add_customer"
        tabindex="-1"
        aria-hidden="true"
    >
        <!--begin::Modal dialog-->
        <div class="modal-dialog modal-dialog-centered mw-650px">
            <!--begin::Modal content-->
            <div class="modal-content">
                <!--begin::Form-->
                <form
                    @submit.prevent="_store"
                    class="form"
                    id="kt_modal_add_customer_form"
                >
                    <!--begin::Modal header-->
                    <div class="modal-header" id="kt_modal_add_customer_header">
                        <!--begin::Modal title-->
                        <h2 class="fw-bolder">Add a User</h2>
                        <!--end::Modal title-->
                        <!--begin::Close-->
                        <div
                            id="kt_modal_add_customer_close"
                            @click="modalClose"
                            class="btn btn-icon btn-sm btn-active-icon-primary"
                        >
                            <!--begin::Svg Icon | path: icons/duotune/arrows/arr061.svg-->
                            <span class="svg-icon svg-icon-1">
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    width="24"
                                    height="24"
                                    viewBox="0 0 24 24"
                                    fill="none"
                                >
                                    <rect
                                        opacity="0.5"
                                        x="6"
                                        y="17.3137"
                                        width="16"
                                        height="2"
                                        rx="1"
                                        transform="rotate(-45 6 17.3137)"
                                        fill="black"
                                    />
                                    <rect
                                        x="7.41422"
                                        y="6"
                                        width="16"
                                        height="2"
                                        rx="1"
                                        transform="rotate(45 7.41422 6)"
                                        fill="black"
                                    />
                                </svg>
                            </span>
                            <!--end::Svg Icon-->
                        </div>
                        <!--end::Close-->
                    </div>
                    <!--end::Modal header-->
                    <!--begin::Modal body-->
                    <div class="modal-body py-10 px-lg-17">
                        <!--begin::Scroll-->
                        <div
                            class="scroll-y me-n7 pe-7"
                            id="kt_modal_add_customer_scroll"
                            data-kt-scroll="true"
                            data-kt-scroll-activate="{default: false, lg: true}"
                            data-kt-scroll-max-height="auto"
                            data-kt-scroll-dependencies="#kt_modal_add_customer_header"
                            data-kt-scroll-wrappers="#kt_modal_add_customer_scroll"
                            data-kt-scroll-offset="300px"
                        >
                            <!--begin::Input group-->
                            <div class="fv-row mb-7">
                                <!--begin::Label-->
                                <label class="required fs-6 fw-bold mb-2"
                                    >Name</label
                                >
                                <!--end::Label-->
                                <!--begin::Input-->
                                <input
                                    type="text"
                                    class="form-control form-control-solid"
                                    placeholder=""
                                    v-model="form.name"
                                    :disabled="edit"
                                />
                                <!--end::Input-->
                            </div>
                            <!--end::Input group-->
                            <!--begin::Input group-->
                            <div class="fv-row mb-7">
                                <!--begin::Label-->
                                <label class="fs-6 fw-bold mb-2">
                                    <span class="required">Email</span>
                                    <i
                                        class="fas fa-exclamation-circle ms-1 fs-7"
                                        data-bs-toggle="tooltip"
                                        title="Email address must be active"
                                    ></i>
                                </label>
                                <!--end::Label-->
                                <!--begin::Input-->
                                <input
                                    type="text"
                                    class="form-control form-control-solid"
                                    placeholder=""
                                    v-model="form.email"
                                    :disabled="edit"
                                />
                                <!--end::Input-->
                            </div>
                            <!--end::Input group-->
                            <div class="fv-row mb-7">
                                <!--begin::Label-->
                                <label class="fs-6 fw-bold mb-2">
                                    <span class="required">Status</span>
                                </label>
                                <!--end::Label-->
                                <!--begin::Input-->
                                <select
                                    v-model="form.status"
                                    class="form-select form-select-solid"
                                >
                                    <option value="0">NON AKTIF</option>
                                    <option value="1" selected="selected">
                                        AKTIF
                                    </option>
                                </select>
                                <!--end::Input-->
                            </div>
                            <!--begin::Input group-->
                            <div class="fv-row mb-7">
                                <!--begin::Label-->
                                <label class="fs-6 fw-bold mb-2">
                                    <span class="required">Password</span>
                                    <i
                                        class="fas fa-exclamation-circle ms-1 fs-7"
                                        data-bs-toggle="tooltip"
                                        title="Password"
                                    ></i>
                                </label>
                                <!--end::Label-->
                                <!--begin::Input-->
                                <input
                                    type="password"
                                    class="form-control form-control-solid"
                                    placeholder=""
                                    v-model="form.password"
                                    :disabled="edit"
                                />
                                <!--end::Input-->
                            </div>
                            <!--end::Input group-->
                            <!--begin::Input group-->
                            <div class="fv-row mb-7">
                                <!--begin::Label-->
                                <label class="fs-6 fw-bold mb-2">
                                    <span class="required"
                                        >Password Confirmation</span
                                    >
                                </label>
                                <!--end::Label-->
                                <!--begin::Input-->
                                <input
                                    type="password"
                                    class="form-control form-control-solid"
                                    placeholder=""
                                    v-model="form.password_confirmation"
                                    :disabled="edit"
                                />
                                <!--end::Input-->
                            </div>
                            <!--end::Input group-->
                        </div>
                        <!--end::Scroll-->
                    </div>
                    <!--end::Modal body-->
                    <!--begin::Modal footer-->
                    <div class="modal-footer flex-center" :hidden="edit">
                        <!--begin::Button-->
                        <button
                            type="reset"
                            id="kt_modal_add_customer_cancel"
                            class="btn btn-light me-3"
                        >
                            Discard/Reset
                        </button>
                        <!--end::Button-->
                        <!--begin::Button-->
                        <button
                            type="submit"
                            id="kt_modal_add_customer_submit"
                            class="btn btn-primary"
                            :disabled="formLoading"
                        >
                            <span class="indicator-label">Submit</span>
                        </button>
                        <!--end::Button-->
                    </div>
                    <!--end::Modal footer-->
                </form>
                <!--end::Form-->
            </div>
        </div>
    </div>
</template>
<script>
import LayoutApp from "@/Layouts/Admin.vue";
import { Head } from "@inertiajs/inertia-vue3";
import Pagination from "@/Components/Pagination";
import VueSelect from "vue-select";
export default {
    layout: LayoutApp,
    components: {
        Head,
        Pagination,
        VueSelect,
    },
    props: {
        name: String,
        users: Object,
    },
    data() {
        return {
            search: "",
            edit: false,
            tes: null,
            form: {
                id: null,
                name: null,
                email: null,
                password: null,
                password_confirmation: null,
            },
            options2: [
                {
                    text: "name1",
                    value: "value1",
                },
                {
                    text: "name2",
                    value: "value2",
                },
            ],
            formLoading: false,
        };
    },
    created() {},
    methods: {
        _search(val) {
            this.$inertia.get(
                route("user.index"),
                { email: val },
                {
                    preserveScroll: true,
                    preserveState: true,
                    onSuccess: (success) => {},
                    onError: (error) => {},
                }
            );
        },
        _new() {
            this.edit = false;
            this.form.id = null;
            this.form.name = null;
            this.form.email = null;
            this.form.password = null;
            this.form.password_confirmation = null;
            $("#kt_modal_add_customer").modal("show");
        },
        _store() {
            if (this.edit == true || this.form.id != null) {
                this._update();
                return;
            }
            this.formLoading = true;
            this.$inertia.post(route("user.store"), this.form, {
                preserveScroll: true,
                onSuccess: (success) => {
                    this.formLoading = false;
                    $("#kt_modal_add_customer").modal("hide");
                    $(".modal-backdrop").remove();
                    Toast.fire({
                        icon: "success",
                        title: "Berhasil ditambah",
                    });
                },
                onError: (error) => {
                    this.formLoading = false;
                    Object.entries(this.$attrs.errors).map((arr) => {
                        this.errors.push(arr[1]);
                    });
                },
            });
        },
        _show(user) {
            this.edit = true;
            this.form.id = user.id;
            this.form.name = user.name;
            this.form.email = user.email;
            this.form.password = null;
            this.form.password_confirmation = null;
            $("#kt_modal_add_customer").modal("show");
        },
        _edit(user) {
            this.edit = false;
            this.form.id = user.id;
            this.form.name = user.name;
            this.form.email = user.email;
            this.form.password = null;
            this.form.password_confirmation = null;
            $("#kt_modal_add_customer").modal("show");
        },
        _update() {
            this.formLoading = true;
            this.$inertia.put(route("user.update", this.form.id), this.form, {
                preserveScroll: true,
                onSuccess: (success) => {
                    this.formLoading = false;
                    $("#kt_modal_add_customer").modal("hide");
                    $(".modal-backdrop").remove();
                    Toast.fire({
                        icon: "success",
                        title: "Berhasil diperbarui",
                    });
                },
                onError: (error) => {
                    this.formLoading = false;
                    Toast.fire({
                        icon: "warning",
                        title: "Somethin wrong!",
                    });
                },
            });
            // return;
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
                    this.$inertia.delete(route("user.destroy", id), {
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
                    });
                }
            });
        },
        modalClose() {
            $("#kt_modal_add_customer").modal("hide");
            $(".modal-backdrop").remove();
        },
    },
};
</script>
