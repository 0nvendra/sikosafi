<template>
    <div class="card mb-6 mb-xl-9">
        <div class="card-header border-0 pt-6">
            <div class="card-title">
                <h1
                    class="d-flex align-items-center text-dark fw-bolder fs-3 my-1"
                >
                    Edit {{ name }}
                </h1>
            </div>
        </div>

        <div class="card-body">
            <form @submit.prevent="_store" class="form">
                <div class="pb-10 pb-lg-12">
                    <!--begin::Title-->
                    <div v-if="errors.length">
                        <b>Terjadi kesalahan:</b>
                        <ul>
                            <li v-for="err in errors" :key="err.id">
                                {{ err }}
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="card-content">
                    <div class="row mb-5">
                        <div class="col-md-6 fv-row fv-plugins-icon-container">
                            <label class="required fs-5 fw-bold mb-2"
                                >NAMA</label
                            >
                            <input
                                type="text"
                                class="form-control form-control-solid"
                                placeholder=""
                                v-model="form.nama"
                                required
                            />
                        </div>
                        <div class="col-md-6 fv-row fv-plugins-icon-container">
                            <label class="required fs-5 fw-bold mb-2"
                                >EMAIL</label
                            >
                            <input
                                type="email"
                                class="form-control form-control-solid"
                                placeholder=""
                                v-model="form.email"
                                required
                            />
                        </div>
                    </div>
                    <div class="row mb-5">
                        <div class="col-md-4 fv-row fv-plugins-icon-container">
                            <label class="required fs-5 fw-bold mb-2"
                                >NOMER INDUK KEPENDUDUKAN(NIK)</label
                            >
                            <input
                                type="text"
                                class="form-control form-control-solid"
                                placeholder=""
                                v-model="form.nik"
                                required
                            />
                        </div>
                        <div class="col-md-4 fv-row fv-plugins-icon-container">
                            <label class="required fs-5 fw-bold mb-2"
                                >TANGGAL LAHIR</label
                            >
                            <input
                                type="date"
                                class="form-control form-control-solid"
                                placeholder=""
                                v-model="form.dob"
                                required
                            />
                        </div>
                        <div class="col-md-4 fv-row fv-plugins-icon-container">
                            <label class="required fs-5 fw-bold mb-2"
                                >STATUS</label
                            >
                            <select
                                class="form-select form-select-solid"
                                data-control="select2"
                                data-placeholder="Select an option"
                                data-allow-clear="true"
                                v-model="form.status"
                            >
                                <option></option>
                                <option value="2">Aktif</option>
                                <option value="3">Non-Aktif</option>
                            </select>
                        </div>
                    </div>
                    <div class="row mb-5">
                        <p>
                            * Abaikan jika password tidak ingin di ubah
                        </p>
                        <div class="col-md-6 fv-row fv-plugins-icon-container">
                            <label class="required fs-5 fw-bold mb-2"
                                >PASSWORD</label
                            >
                            <input
                                type="password"
                                class="form-control form-control-solid"
                                placeholder=""
                                v-model="form.password"
                            />
                        </div>
                        <div class="col-md-6 fv-row fv-plugins-icon-container">
                            <label class="required fs-5 fw-bold mb-2"
                                >PASSWORD CONFIRMATION</label
                            >
                            <input
                                type="password"
                                class="form-control form-control-solid"
                                placeholder=""
                                v-model="form.password_confirmation"
                            />
                        </div>
                    </div>
                </div>
                <div class="modal-footer flex-center">
                    <button
                        @click="back"
                        type="button"
                        class="btn btn-dark me-3"
                    >
                        Back
                    </button>
                    <button
                        @click="reset"
                        type="reset"
                        class="btn btn-warning me-3"
                    >
                        Reset
                    </button>
                    <button type="submit" class="btn btn-primary">
                        <span class="indicator-label">Simpan</span>
                    </button>
                </div>
            </form>
        </div>
    </div>
</template>
<script>
import LayoutApp from "@/Layouts/Admin.vue";
import { Head, Link } from "@inertiajs/inertia-vue3";
import Pagination from "@/Components/Pagination";
import flatPickr from "vue-flatpickr-component";
export default {
    layout: LayoutApp,
    components: {
        Head,
        Link,
        Pagination,
        flatPickr,
    },
    props: {
        name: String,
        user: Object,
    },
    data() {
        return {
            errors: [],
            form: {
                id: this.user.id,
                nama: this.user.nama,
                email: this.user.email,
                nik: this.user.nik,
                dob: this.user.dob,
                status: this.user.status,
            },
        };
    },
    created() {},
    methods: {
        back() {
            window.history.back();
        },
        reset() {
            this.form = [];
        },
        _store() {
            // this.formLoading = true;
            this.$inertia.put(route("user.update", this.form.id), this.form, {
                preserveScroll: true,
                onSuccess: (success) => {
                    Toast.fire({
                        icon: "success",
                        title: "Diperbarui",
                    });
                },
                onError: (error) => {
                    this.errors = [];
                    Object.entries(this.$attrs.errors).map((arr) => {
                        this.errors.push(arr[1]);
                    });
                },
            });
        },
    },
};
</script>
