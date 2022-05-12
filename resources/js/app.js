require("./bootstrap");

import { createApp, h } from "vue";
import { createInertiaApp } from "@inertiajs/inertia-vue3";
import { InertiaProgress } from "@inertiajs/progress";

const appName =
    window.document.getElementsByTagName("title")[0]?.innerText || "Laravel";

createInertiaApp({
    title: (title) => `${title} - ${appName}`,
    resolve: (name) => require(`./Pages/${name}.vue`),
    setup({ el, App, props, plugin }) {
        // return createApp({ render: () => h(app, props) })
        //     .use(plugin)
        //     .mixin({ methods: { route } })
        //     .mount(el);
        const app = createApp({ render: () => h(App, props) })
            .use(plugin)
            .mixin({ methods: { route } });

        app.config.globalProperties.$filters = {
            currency(value) {
                return "Rp. " + new Intl.NumberFormat("en-ID").format(value);
            },
            fasilitas(value) {
                // var arr = value.split(value, "-");
                // console.clear();
                // console.log(arr]);
                // return arr[1];
            },
        };

        app.mount(el);
    },
});
window.Toast = Swal.mixin({
    toast: true,
    position: "top-end",
    showConfirmButton: false,
    timer: 3000,
    timerProgressBar: true,
    didOpen: (toast) => {
        toast.addEventListener("mouseenter", Swal.stopTimer);
        toast.addEventListener("mouseleave", Swal.resumeTimer);
    },
});
window.Swal = Swal;

InertiaProgress.init({ color: "#4B5563" });
