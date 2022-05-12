<template>
    <div class="d-flex flex-column flex-root">
        <!--begin::Header Section-->
        <div class="mb-0" id="home">
            <!--begin::Wrapper-->
            <div
                class="bgi-no-repeat bgi-size-contain bgi-position-x-center bgi-position-y-bottom landing-dark-bg"
            >
                <!--begin::Header-->
                <div
                    class="landing-header"
                    data-kt-sticky="true"
                    data-kt-sticky-name="landing-header"
                    data-kt-sticky-offset="{default: '200px', lg: '300px'}"
                >
                    <!--begin::Container-->
                    <div class="container">
                        <!--begin::Wrapper-->
                        <div
                            class="d-flex align-items-center justify-content-between"
                        >
                            <!--begin::Logo-->
                            <div class="d-flex align-items-center flex-equal">
                                <!--begin::Mobile menu toggle-->
                                <button
                                    class="btn btn-icon btn-active-color-primary me-3 d-flex d-lg-none"
                                    id="kt_landing_menu_toggle"
                                >
                                    <!--begin::Svg Icon | path: icons/duotune/abstract/abs015.svg-->
                                    <span class="svg-icon svg-icon-2hx">
                                        <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            width="24"
                                            height="24"
                                            viewBox="0 0 24 24"
                                            fill="none"
                                        >
                                            <path
                                                d="M21 7H3C2.4 7 2 6.6 2 6V4C2 3.4 2.4 3 3 3H21C21.6 3 22 3.4 22 4V6C22 6.6 21.6 7 21 7Z"
                                                fill="black"
                                            />
                                            <path
                                                opacity="0.3"
                                                d="M21 14H3C2.4 14 2 13.6 2 13V11C2 10.4 2.4 10 3 10H21C21.6 10 22 10.4 22 11V13C22 13.6 21.6 14 21 14ZM22 20V18C22 17.4 21.6 17 21 17H3C2.4 17 2 17.4 2 18V20C2 20.6 2.4 21 3 21H21C21.6 21 22 20.6 22 20Z"
                                                fill="black"
                                            />
                                        </svg>
                                    </span>
                                    <!--end::Svg Icon-->
                                </button>
                                <!--end::Mobile menu toggle-->
                                <!--begin::Logo image-->
                                <h1 style="color: white">SIKOSAFI</h1>
                                <!--end::Logo image-->
                            </div>
                            <!--end::Logo-->
                            <!--begin::Menu wrapper-->
                            <div class="d-lg-block" id="kt_header_nav_wrapper">
                                <div
                                    class="d-lg-block p-5 p-lg-0"
                                    data-kt-drawer="true"
                                    data-kt-drawer-name="landing-menu"
                                    data-kt-drawer-activate="{default: true, lg: false}"
                                    data-kt-drawer-overlay="true"
                                    data-kt-drawer-width="200px"
                                    data-kt-drawer-direction="start"
                                    data-kt-drawer-toggle="#kt_landing_menu_toggle"
                                    data-kt-swapper="true"
                                    data-kt-swapper-mode="prepend"
                                    data-kt-swapper-parent="{default: '#kt_body', lg: '#kt_header_nav_wrapper'}"
                                >
                                    <!--begin::Menu-->
                                    <div
                                        class="menu menu-column flex-nowrap menu-rounded menu-lg-row menu-title-gray-500 menu-state-title-primary nav nav-flush fs-5 fw-bold"
                                        id="kt_landing_menu"
                                    >
                                        <!--begin::Menu item-->
                                        <div class="menu-item">
                                            <!--begin::Menu link-->
                                            <Link
                                                :href="route('front.index')"
                                                class="menu-link nav-link active py-3 px-4 px-xxl-6"
                                                data-kt-scroll-toggle="true"
                                                data-kt-drawer-dismiss="true"
                                                >Gallery & Review</Link
                                            >
                                            <!--end::Menu link-->
                                        </div>
                                        <!--end::Menu item-->
                                        <!--begin::Menu item-->
                                        <div class="menu-item">
                                            <!--begin::Menu link-->
                                            <Link
                                                :href="route('front.tata')"
                                                class="menu-link nav-link active py-3 px-4 px-xxl-6"
                                                data-kt-scroll-toggle="true"
                                                data-kt-drawer-dismiss="true"
                                                >Tata Cara Sewa</Link
                                            >
                                            <!--end::Menu link-->
                                        </div>
                                        <!--end::Menu item-->
                                        <!--begin::Menu item-->
                                        <div class="menu-item">
                                            <!--begin::Menu link-->
                                            <Link
                                                :href="route('front.room')"
                                                class="menu-link nav-link active py-3 px-4 px-xxl-6"
                                                data-kt-scroll-toggle="true"
                                                data-kt-drawer-dismiss="true"
                                                >Room</Link
                                            >
                                            <!--end::Menu link-->
                                        </div>
                                        <!--end::Menu item-->
                                        <!--begin::Menu item-->
                                        <div class="menu-item">
                                            <!--begin::Menu link-->
                                            <Link
                                                :href="route('front.rule')"
                                                class="menu-link nav-link active py-3 px-4 px-xxl-6"
                                                data-kt-scroll-toggle="true"
                                                data-kt-drawer-dismiss="true"
                                                >Peraturan</Link
                                            >
                                            <!--end::Menu link-->
                                        </div>
                                        <!--end::Menu item-->
                                    </div>
                                    <!--end::Menu-->
                                </div>
                            </div>
                            <!--end::Menu wrapper-->
                            <!--begin::Toolbar-->
                            <div class="text-end ms-1" v-if="user == []">
                                <Link
                                    :href="route('login')"
                                    class="btn btn-success"
                                    data-kt-scroll-toggle="true"
                                    data-kt-drawer-dismiss="true"
                                    >Sign In</Link
                                >
                            </div>
                            <div class="menu-item" v-else>
                                <!--begin::Menu link-->
                                <Link
                                    :href="route('front.index')"
                                    class="menu-link nav-link active py-3 px-4 px-xxl-6"
                                    data-kt-scroll-toggle="true"
                                    data-kt-drawer-dismiss="true"
                                    >History Saya</Link
                                >
                                <!--end::Menu link-->
                            </div>
                            <!--end::Toolbar-->
                        </div>
                        <!--end::Wrapper-->
                    </div>
                    <!--end::Container-->
                </div>
                <!--end::Header-->
            </div>
            <!--end::Wrapper-->
            <!--begin::Curve bottom-->
            <div class="landing-dark-color mb-10 mb-lg-20">
                <svg
                    viewBox="15 12 1470 48"
                    fill="none"
                    xmlns="http://www.w3.org/2000/svg"
                >
                    <path
                        d="M0 11C3.93573 11.3356 7.85984 11.6689 11.7725 12H1488.16C1492.1 11.6689 1496.04 11.3356 1500 11V12H1488.16C913.668 60.3476 586.282 60.6117 11.7725 12H0V11Z"
                        fill="currentColor"
                    ></path>
                </svg>
            </div>
            <!--end::Curve bottom-->
        </div>
        <!--end::Header Section-->
        <slot />
        <!--begin::Footer Section-->
        <div class="mb-0">
            <!--begin::Wrapper-->
            <div class="landing-dark-bg pt-20">
                <!--begin::Separator-->
                <div class="landing-dark-separator"></div>
                <!--end::Separator-->
                <!--begin::Container-->
                <div class="container">
                    <!--begin::Wrapper-->
                    <div
                        class="d-flex flex-column flex-md-row flex-stack py-7 py-lg-10"
                    >
                        <!--begin::Copyright-->
                        <div
                            class="d-flex align-items-center order-2 order-md-1"
                        >
                            <!--begin::Logo image-->
                            <span
                                class="mx-5 fs-6 fw-bold text-gray-600 pt-1"
                                href="https://keenthemes.com"
                                >© 2022 SIKOSAFI</span
                            >

                            <!--end::Logo image-->
                        </div>
                        <!--end::Copyright-->
                        <!--begin::Menu-->
                        <ul
                            class="menu menu-gray-600 menu-hover-primary fw-bold fs-6 fs-md-5 order-1 mb-5 mb-md-0"
                        >
                            <li class="menu-item">
                                <a
                                    href="https://wa.me/6281345555506"
                                    target="_blank"
                                    class="btn btn-success"
                                    ><svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        width="16"
                                        height="16"
                                        fill="currentColor"
                                        class="bi bi-whatsapp"
                                        viewBox="0 0 16 16"
                                    >
                                        <path
                                            d="M13.601 2.326A7.854 7.854 0 0 0 7.994 0C3.627 0 .068 3.558.064 7.926c0 1.399.366 2.76 1.057 3.965L0 16l4.204-1.102a7.933 7.933 0 0 0 3.79.965h.004c4.368 0 7.926-3.558 7.93-7.93A7.898 7.898 0 0 0 13.6 2.326zM7.994 14.521a6.573 6.573 0 0 1-3.356-.92l-.24-.144-2.494.654.666-2.433-.156-.251a6.56 6.56 0 0 1-1.007-3.505c0-3.626 2.957-6.584 6.591-6.584a6.56 6.56 0 0 1 4.66 1.931 6.557 6.557 0 0 1 1.928 4.66c-.004 3.639-2.961 6.592-6.592 6.592zm3.615-4.934c-.197-.099-1.17-.578-1.353-.646-.182-.065-.315-.099-.445.099-.133.197-.513.646-.627.775-.114.133-.232.148-.43.05-.197-.1-.836-.308-1.592-.985-.59-.525-.985-1.175-1.103-1.372-.114-.198-.011-.304.088-.403.087-.088.197-.232.296-.346.1-.114.133-.198.198-.33.065-.134.034-.248-.015-.347-.05-.099-.445-1.076-.612-1.47-.16-.389-.323-.335-.445-.34-.114-.007-.247-.007-.38-.007a.729.729 0 0 0-.529.247c-.182.198-.691.677-.691 1.654 0 .977.71 1.916.81 2.049.098.133 1.394 2.132 3.383 2.992.47.205.84.326 1.129.418.475.152.904.129 1.246.08.38-.058 1.171-.48 1.338-.943.164-.464.164-.86.114-.943-.049-.084-.182-.133-.38-.232z"
                                        />
                                    </svg>
                                </a>
                            </li>
                            <li class="menu-item mx-5">
                                <p style="color: white">
                                    Awang Faroek Institute, Jl. M Yamin, No 20,
                                    <br />
                                    Gunung kelua, Kec. Samarinda Ulu, Kota
                                    Samarinda, Kalimantan Timur 75123
                                </p>
                            </li>
                        </ul>
                        <!--end::Menu-->
                    </div>
                    <!--end::Wrapper-->
                </div>
                <!--end::Container-->
            </div>
            <!--end::Wrapper-->
        </div>
        <!--end::Footer Section-->
    </div>
</template>
<script>
import { Head, Link } from "@inertiajs/inertia-vue3";
import NavLink from "@/components/ResponsiveNavLink.vue";
export default {
    components: {
        Head,
        Link,
        NavLink,
    },
    data() {
        return {
            user: [],
        };
    },
    created() {
        this.user = this.$attrs.auth.user;
        // console.clear();
        // console.log(this.user);
        // this.gudang = this.$attrs.auth.user.gudang.name;
    },

    methods: {},
};
</script>
