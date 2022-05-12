<template>
    <div>
        <!--begin::Content-->
        <div
            class="d-flex flex-center flex-column flex-column-fluid p-10 pb-lg-20"
        >
            <!--begin::Logo-->
            <a class="mb-12">
                <h1>Daftar</h1>
            </a>
            <!--end::Logo-->
            <!--begin::Wrapper-->
            <form @submit.prevent="_store" class="form">
                <div
                    class="w-lg-600px bg-body rounded shadow-sm p-10 p-lg-15 mx-auto"
                >
                    <!--begin::Form-->
                    <form
                        class="form w-100"
                        novalidate="novalidate"
                        id="kt_sign_up_form"
                    >
                        <!--begin::Heading-->
                        <div class="mb-10 text-center">
                            <!--begin::Title-->
                            <h1 class="text-dark mb-3">Create an Account</h1>
                            <!--end::Title-->
                            <!--begin::Link-->
                            <div class="text-gray-400 fw-bold fs-4">
                                Already have an account?
                                <a
                                    href="../../demo1/dist/authentication/flows/basic/sign-in.html"
                                    class="link-primary fw-bolder"
                                    >Sign in here</a
                                >
                            </div>
                            <!--end::Link-->
                        </div>
                        <!--end::Heading-->
                        <!--begin::Input group-->
                        <div class="row fv-row mb-7">
                            <!--begin::Col-->
                            <div class="col-xl-12">
                                <label
                                    class="required form-label fw-bolder text-dark fs-6"
                                    >Nama Lengkap (Sesuai KTP)</label
                                >
                                <input
                                    class="form-control form-control-lg form-control-solid"
                                    type="text"
                                    autocomplete="off"
                                    v-model="form.nama"
                                    requried
                                />
                            </div>
                            <!--end::Col-->
                        </div>
                        <!--end::Input group-->
                        <!--begin::Input group-->
                        <div class="fv-row mb-7">
                            <label
                                class="required form-label fw-bolder text-dark fs-6"
                                >NIK</label
                            >
                            <input
                                class="form-control form-control-lg form-control-solid"
                                type="email"
                                placeholder=""
                                name="email"
                                autocomplete="off"
                                v-model="form.nik"
                                requried
                            />
                        </div>
                        <!--begin::Input group-->
                        <div class="fv-row mb-7">
                            <label
                                class="required form-label fw-bolder text-dark fs-6"
                                >Tgl Lahir</label
                            >
                            <input
                                class="form-control form-control-lg form-control-solid"
                                type="date"
                                placeholder=""
                                name="email"
                                autocomplete="off"
                                v-model="form.dob"
                                requried
                            />
                        </div>
                        <!--end::Input group-->
                        <!--begin::Input group-->
                        <div class="fv-row mb-7">
                            <label
                                class="required form-label fw-bolder text-dark fs-6"
                                >Foto KTP</label
                            >
                            <input
                                class="form-control form-control-lg form-control-solid"
                                type="file"
                                @change="previewImage"
                                ref="photo"
                                accept="image/png, image/gif, image/jpeg"
                                autocomplete="off"
                                requried
                            />
                            <center>
                                <img v-if="url" :src="url" class="w-50 h-80" />
                            </center>
                        </div>

                        <!--end::Input group-->
                        <!--begin::Input group-->
                        <div class="fv-row mb-7">
                            <label
                                class="required form-label fw-bolder text-dark fs-6"
                                >Email</label
                            >
                            <input
                                class="form-control form-control-lg form-control-solid"
                                type="email"
                                placeholder=""
                                name="email"
                                autocomplete="off"
                                v-model="form.email"
                                requried
                            />
                        </div>
                        <!--end::Input group-->
                        <!--begin::Input group-->
                        <div class="mb-10 fv-row" data-kt-password-meter="true">
                            <!--begin::Wrapper-->
                            <div class="mb-1">
                                <!--begin::Label-->
                                <label
                                    class="required form-label fw-bolder text-dark fs-6"
                                    >Password</label
                                >
                                <!--end::Label-->
                                <!--begin::Input wrapper-->
                                <div class="position-relative mb-3">
                                    <input
                                        class="form-control form-control-lg form-control-solid"
                                        type="password"
                                        placeholder=""
                                        name="password"
                                        autocomplete="off"
                                        v-model="form.password"
                                        requried
                                    />
                                </div>
                                <!--end::Input wrapper-->
                            </div>
                            <!--end::Wrapper-->
                        </div>
                        <!--end::Input group=-->
                        <!--begin::Input group-->
                        <div class="fv-row mb-5">
                            <label
                                class="required form-label fw-bolder text-dark fs-6"
                                >Password Konfirmasi</label
                            >
                            <input
                                class="form-control form-control-lg form-control-solid"
                                type="password"
                                placeholder=""
                                name="confirm-password"
                                autocomplete="off"
                                v-model="form.password_confirmation"
                                requried
                            />
                        </div>
                        <!--end::Input group-->
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
                        <!--begin::Actions-->
                        <div class="text-center">
                            <button
                                @click="_store"
                                type="button"
                                class="btn btn-primary"
                            >
                                <span class="indicator-label">{{
                                    btn_text
                                }}</span>
                            </button>
                        </div>
                        <!--end::Actions-->
                    </form>
                    <!--end::Form-->
                </div>
            </form>
            <!--end::Wrapper-->
        </div>
        <!--end::Content-->
    </div>
</template>

<script>
import { Head, Link } from "@inertiajs/inertia-vue3";

export default {
    components: {
        Head,
        Link,
    },

    props: {},

    data() {
        return {
            url: null,
            errors: [],
            form: {
                nama: null,
                email: null,
                password: null,
                password_confirmation: null,
                nik: null,
                dob: null,
            },
            btn_text: "Register",
        };
    },

    methods: {
        previewImage(e) {
            const file = e.target.files[0];
            this.url = URL.createObjectURL(file);
        },
        _store() {
            this.btn_text = "Mendaftar...";
            if (this.$refs.photo) {
                this.form.image = this.$refs.photo.files[0];
            }
            this.$inertia.post(route("user.register"), this.form, {
                preserveScroll: true,
                onSuccess: (success) => {
                    this.btn_text = "Register";
                    Toast.fire({
                        icon: "success",
                        title: "Berhasil ditambah",
                    });
                },
                onError: (error) => {
                    this.btn_text = "Register";
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
