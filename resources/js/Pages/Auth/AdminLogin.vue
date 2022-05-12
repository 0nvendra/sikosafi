<template>
    <div>
        <!--begin::Content-->
        <div
            class="d-flex flex-center flex-column flex-column-fluid p-10 pb-lg-20"
        >
            <!--begin::Wrapper-->
            <div
                class="w-lg-500px bg-body rounded shadow-sm p-10 p-lg-15"
                style="margin-top: 100px"
            >
                <!--begin::Form-->
                <form
                    class="form w-100"
                    novalidate="novalidate"
                    id="kt_sign_in_form"
                    @submit.prevent="submit"
                >
                    <!--begin::Heading-->
                    <div class="text-center mb-10">
                        <!--begin::Title-->
                        <h2>ADMIN LOGIN</h2>
                        <!--end::Title-->
                    </div>
                    <!--begin::Heading-->
                    <!--begin::Input group-->
                    <div class="fv-row mb-10">
                        <!--begin::Label-->
                        <label class="form-label fs-6 fw-bolder text-dark"
                            >Email</label
                        >
                        <!--end::Label-->
                        <!--begin::Input-->
                        <input
                            class="form-control form-control-lg form-control-solid"
                            type="text"
                            v-model="form.email"
                            autocomplete="off"
                        />
                        <!--end::Input-->
                    </div>
                    <!--end::Input group-->
                    <!--begin::Input group-->
                    <div class="fv-row mb-10">
                        <label class="form-label fs-6 fw-bolder text-dark"
                            >Password</label
                        >
                        <!--begin::Input-->
                        <input
                            class="form-control form-control-lg form-control-solid"
                            type="password"
                            v-model="form.password"
                            autocomplete="off"
                        />
                        <!--end::Input-->
                    </div>
                    <!--end::Input group-->
                    <!--begin::Actions-->
                    <div class="text-center">
                        <!--begin::Submit button-->
                        <button
                            type="submit"
                            id="kt_sign_in_submit"
                            class="btn btn-lg btn-primary w-100 mb-5"
                            :disabled="form.processing"
                        >
                            <span class="indicator-label">Continue</span>
                            <span class="indicator-progress"
                                >Please wait...
                                <span
                                    class="spinner-border spinner-border-sm align-middle ms-2"
                                ></span
                            ></span>
                        </button>
                        <!--end::Submit button-->
                        <!--begin::Separator-->
                    </div>
                </form>
                <!--end::Form-->
            </div>
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

    props: {
        canResetPassword: Boolean,
        status: String,
    },

    data() {
        return {
            form: this.$inertia.form({
                email: "",
                password: "",
                remember: false,
            }),
        };
    },

    methods: {
        submit() {
            this.form.post(this.route("admin.login.exec"), {
                onFinish: () => {
                    // this.$router.push(route('dashboard'));
                    window.location.href = route("user.index");
                },
            });
        },
    },
};
</script>
