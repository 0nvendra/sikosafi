<template>
    <div class="container">
        <div class="mb-17">
            <!--begin::Content-->
            <div class="d-flex flex-stack mb-5">
                <!--begin::Title-->
                <h3 class="text-black">Rooms</h3>
                <!--end::Title-->                
            </div>
            <!--end::Content-->
            <!--begin::Separator-->
            <div class="separator separator-dashed mb-9"></div>
            <!--end::Separator-->
            <div>
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
                        placeholder="Cari berdasarkan Fasilitas"
                        @keydown.enter="_searchFasilitas($event.target.value)"
                    />
                </div>
            </div>
            <!--begin::Row-->
            <div class="d-flex flex-wrap flex-stack my-5">
                <div class="row g-6 g-xl-9">
                    <!--begin::Col-->
                    <div
                        v-for="row in rooms.data"
                        :key="row.id"
                        :class="sClass"
                    >
                        <!--begin::Card-->
                        <div
                            class="card border border-2 border-gray-300 border-hover"
                        >
                            <!--begin:: Card body-->
                            <div class="card-body p-9">
                                <!--begin::Name-->
                                <div class="fs-3 fw-bolder text-dark mb-2">
                                    <div class="row">
                                        <div class="col-md-6">
                                            Room No : {{ row.nomor_room }}
                                        </div>
                                        <div class="col-md-6 text-end">
                                            <div
                                                v-html="row.tersedia.span"
                                            ></div>
                                        </div>
                                    </div>
                                </div>
                                <h5 class="mb-4">{{ row.tipe_room.desc }}</h5>
                                <div
                                    class="separator separator-dashed mb-4"
                                ></div>
                                <!--end::Name-->
                                <!--begin::Info-->
                                <div class="d-flex flex-wrap mb-2">
                                    <!--begin::Due-->
                                    <div
                                        class="border border-gray-300 border-dashed rounded min-w-125px py-3 px-4 me-7 mb-3"
                                        v-if="!row.tersedia.status"
                                    >
                                        <div
                                            class="fs-6 text-gray-800 fw-bolder"
                                        >
                                            {{ row.tersedia.end_contract }}
                                        </div>
                                        <div class="fw-bold text-gray-400">
                                            Mulai tersedia
                                        </div>
                                    </div>
                                    <!--end::Due-->
                                    <!--begin::Budget-->
                                    <div
                                        class="border border-gray-300 border-dashed rounded min-w-125px py-3 px-4 mb-3"
                                    >
                                        <div
                                            class="fs-6 text-gray-800 fw-bolder"
                                        >
                                            {{ $filters.currency(row.price) }}
                                            /Bulan
                                        </div>
                                        <div class="fw-bold text-gray-400">
                                            Biaya
                                        </div>
                                    </div>
                                    <!--end::Budget-->
                                </div>
                                <div>
                                    <h4>Fasilitas</h4>
                                    <li
                                        v-for="(f, i) in row.fasilitas.descF"
                                        :key="f"
                                        class="d-flex align-items-center py-2"
                                    >
                                        <div v-if="i > 0">
                                            <span class="bullet bg-dark"></span>
                                            {{ f }}
                                        </div>
                                    </li>
                                </div>
                                <div
                                    class="separator separator-dashed mb-9"
                                ></div>
                                <div class="text-end">
                                    <button
                                        type="submit"
                                        class="btn btn-danger btn-sm"
                                        :disabled="!row.tersedia.status"
                                    >
                                        <span class="indicator-label"
                                            >Booking</span
                                        >
                                    </button>
                                </div>
                                <!--end::Info-->
                            </div>
                            <!--end:: Card body-->
                        </div>
                        <!--end::Card-->
                    </div>
                    <!--end::Col-->
                </div>
                <br />
                <!--end::Row-->
            </div>
        </div>
    </div>
</template>
<script>
import LayoutApp from "@/Layouts/Front.vue";
import { Head, Link } from "@inertiajs/inertia-vue3";
export default {
    layout: LayoutApp,
    components: {
        Head,
        Link,
    },
    props: {
        rooms: Object,
    },
    data() {
        return {
            sClass: "col-md-4",
        };
    },
    created() {},
    methods: {
        _searchFasilitas(val) {
            if (val == "") {
                this.sClass = "col-md-4";
            } else {
                this.sClass = "col-md-12";
            }
            this.$inertia.get(
                route("front.room"),
                { fasilitas: val },
                {
                    preserveScroll: true,
                    preserveState: true,
                    onSuccess: (success) => {},
                    onError: (error) => {},
                }
            );
        },
    },
};
</script>
