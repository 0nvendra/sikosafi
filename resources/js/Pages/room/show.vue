<template>
    <div class="card mb-6 mb-xl-9">
        <div class="card-header border-0 pt-6">
            <div class="card-title">
                <h1
                    class="d-flex align-items-center text-dark fw-bolder fs-3 my-1"
                >
                    Show {{ name }}
                </h1>
                <Link
                    :href="route('room.edit', form.id)"
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
                    @click="_remove(form.id)"
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
                                disabled
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
                                disabled
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
                                disabled
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
                                disabled
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
                                disabled
                            />
                        </div>
                    </div>
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
        room: Object,
        trooms: Object,
        fasilitases: Object,
    },
    data() {
        return {
            errors: [],
            form: {
                id: this.room.id,
                nomor_room: this.room.nomor_room,
                lantai: this.room.lantai,
                tipe_room_id: this.room.tipe_room_id,
                fasilitas_id: this.room.fasilitas_id,
                price: this.room.price,
            },
            tipe_room_id: this.room.tipe_room_id,
            fasilitas_id: this.room.fasilitas_id,
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
