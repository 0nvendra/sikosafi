<template>
    <div class="card mb-6 mb-xl-9">
        <div class="card-header border-0 pt-6">
            <div class="card-title">
                <h1
                    class="d-flex align-items-center text-dark fw-bolder fs-3 my-1"
                >
                    Add {{ name }}
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
                                >NO ROOM</label
                            >
                            <input
                                type="number"
                                class="form-control form-control-solid"
                                placeholder=""
                                v-model="form.nomor_room"
                                required
                            />
                        </div>
                        <div class="col-md-6 fv-row fv-plugins-icon-container">
                            <label class="required fs-5 fw-bold mb-2"
                                >LANTAI</label
                            >
                            <input
                                type="number"
                                class="form-control form-control-solid"
                                placeholder=""
                                v-model="form.lantai"
                                required
                            />
                        </div>
                    </div>
                    <div class="row mb-5">
                        <div class="col-md-6 fv-row fv-plugins-icon-container">
                            <label class="required fs-5 fw-bold mb-2"
                                >TIPE ROOM</label
                            >
                            <select
                                class="form-select form-select-solid"
                                data-control="select2"
                                data-placeholder="Select an option"
                                data-allow-clear="true"
                                v-model="tipe_room_id"
                                required
                            >
                                <option
                                    v-for="row in trooms"
                                    :key="row.id"
                                    :value="row.id"
                                >
                                    {{ row.desc }}
                                </option>
                            </select>
                        </div>
                        <div class="col-md-6 fv-row fv-plugins-icon-container">
                            <label class="required fs-5 fw-bold mb-2"
                                >FASILITAS</label
                            >
                            <select
                                class="form-select form-select-solid"
                                data-control="select2"
                                data-placeholder="Select an option"
                                data-allow-clear="true"
                                v-model="fasilitas_id"
                            >
                                <option
                                    v-for="row in fasilitases"
                                    :key="row.id"
                                    :value="row.id"
                                >
                                    {{ row.desc }}
                                </option>
                            </select>
                        </div>
                    </div>
                    <div class="row mb-5">
                        <div class="col-md-12 fv-row fv-plugins-icon-container">
                            <label class="required fs-5 fw-bold mb-2"
                                >HARGA SEWA(BULANAN)</label
                            >
                            <currency-input
                                v-model.lazy="form.price"
                                class="form-control form-control-solid"
                                :options="currency_option"
                                required
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
import CurrencyInput from "@/Components/CurrencyInput";
export default {
    layout: LayoutApp,
    components: {
        Head,
        Link,
        Pagination,
        flatPickr,
        CurrencyInput,
    },
    props: {
        name: String,
        trooms: Object,
        fasilitases: Object,
    },
    data() {
        return {
            errors: [],
            form: {
                id: null,
                nomor_room: null,
                lantai: null,
                tipe_room_id: null,
                fasilitas_id: null,
                price: 0,
            },
            tipe_room_id: null,
            fasilitas_id: null,
            currency_option: {
                currency: "IDR",
                precision: 2,
            },
        };
    },
    watch: {
        // watch for select2
        tipe_room_id: function (val) {
            this.form.tipe_room_id = val;
        },
        fasilitas_id: function (val) {
            this.form.fasilitas_id = val;
        },
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
            this.$inertia.post(route("room.store"), this.form, {
                preserveScroll: true,
                onSuccess: (success) => {
                    Toast.fire({
                        icon: "success",
                        title: "Berhasil ditambah",
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
