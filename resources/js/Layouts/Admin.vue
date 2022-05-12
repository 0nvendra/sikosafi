<template>
    <div class="d-flex flex-column flex-root">
        <!--begin::Page-->
        <div class="page d-flex flex-row flex-column-fluid">
            <div
                id="kt_aside"
                class="aside aside-light aside-hoverable drawer drawer-start"
                data-kt-drawer="true"
                data-kt-drawer-name="aside"
                data-kt-drawer-activate="{default: true, lg: false}"
                data-kt-drawer-overlay="true"
                data-kt-drawer-width="{default:'200px', '300px': '250px'}"
                data-kt-drawer-direction="start"
                data-kt-drawer-toggle="#kt_aside_mobile_toggle"
                style="width: 250px !important"
            >
                <!--begin::Brand-->
                <div class="aside-logo flex-column-auto" id="kt_aside_logo">
                    <!--begin::Logo-->
                    <h1>SIKOSAFI-admin</h1>
                    <!--end::Logo-->
                    <!--begin::Aside toggler-->
                    <div
                        id="kt_aside_toggle"
                        class="btn btn-icon w-auto px-0 btn-active-color-primary aside-toggle"
                        data-kt-toggle="true"
                        data-kt-toggle-state="active"
                        data-kt-toggle-target="body"
                        data-kt-toggle-name="aside-minimize"
                    >
                        <!--begin::Svg Icon | path: icons/duotune/arrows/arr079.svg-->
                        <span class="svg-icon svg-icon-1 rotate-180">
                            <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="24"
                                height="24"
                                viewBox="0 0 24 24"
                                fill="none"
                            >
                                <path
                                    opacity="0.5"
                                    d="M14.2657 11.4343L18.45 7.25C18.8642 6.83579 18.8642 6.16421 18.45 5.75C18.0358 5.33579 17.3642 5.33579 16.95 5.75L11.4071 11.2929C11.0166 11.6834 11.0166 12.3166 11.4071 12.7071L16.95 18.25C17.3642 18.6642 18.0358 18.6642 18.45 18.25C18.8642 17.8358 18.8642 17.1642 18.45 16.75L14.2657 12.5657C13.9533 12.2533 13.9533 11.7467 14.2657 11.4343Z"
                                    fill="black"
                                />
                                <path
                                    d="M8.2657 11.4343L12.45 7.25C12.8642 6.83579 12.8642 6.16421 12.45 5.75C12.0358 5.33579 11.3642 5.33579 10.95 5.75L5.40712 11.2929C5.01659 11.6834 5.01659 12.3166 5.40712 12.7071L10.95 18.25C11.3642 18.6642 12.0358 18.6642 12.45 18.25C12.8642 17.8358 12.8642 17.1642 12.45 16.75L8.2657 12.5657C7.95328 12.2533 7.95328 11.7467 8.2657 11.4343Z"
                                    fill="black"
                                />
                            </svg>
                        </span>
                        <!--end::Svg Icon-->
                    </div>
                    <!--end::Aside toggler-->
                </div>
                <!--end::Brand-->
                <!--begin::Aside menu-->
                <div class="aside-menu flex-column-fluid">
                    <!--begin::Aside Menu-->
                    <div
                        class="hover-scroll-overlay-y my-5 my-lg-5"
                        id="kt_aside_menu_wrapper"
                        data-kt-scroll="true"
                        data-kt-scroll-activate="{default: false, lg: true}"
                        data-kt-scroll-height="auto"
                        data-kt-scroll-dependencies="#kt_aside_logo, #kt_aside_footer"
                        data-kt-scroll-wrappers="#kt_aside_menu"
                        data-kt-scroll-offset="0"
                    >
                        <!--begin::Menu-->
                        <div
                            class="menu menu-column menu-title-gray-800 menu-state-title-primary menu-state-icon-primary menu-state-bullet-primary menu-arrow-gray-500"
                            id="#kt_aside_menu"
                            data-kt-menu="true"
                        >
                            <div class="menu-item">
                                <div class="menu-content pb-2">
                                    <span
                                        class="menu-section text-muted text-uppercase fs-8 ls-1"
                                        >MASTER</span
                                    >
                                </div>
                            </div>
                            <div class="menu-item">
                                <NavLink
                                    :href="route('user.index')"
                                    class="menu-link"
                                >
                                    <span class="menu-icon">
                                        <!--begin::Svg Icon | path: icons/duotune/communication/com001.svg-->
                                        <span class="svg-icon svg-icon-2">
                                            <svg
                                                xmlns="http://www.w3.org/2000/svg"
                                                width="16"
                                                height="16"
                                                fill="currentColor"
                                                class="bi bi-people"
                                                viewBox="0 0 16 16"
                                            >
                                                <path
                                                    d="M15 14s1 0 1-1-1-4-5-4-5 3-5 4 1 1 1 1h8zm-7.978-1A.261.261 0 0 1 7 12.996c.001-.264.167-1.03.76-1.72C8.312 10.629 9.282 10 11 10c1.717 0 2.687.63 3.24 1.276.593.69.758 1.457.76 1.72l-.008.002a.274.274 0 0 1-.014.002H7.022zM11 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm3-2a3 3 0 1 1-6 0 3 3 0 0 1 6 0zM6.936 9.28a5.88 5.88 0 0 0-1.23-.247A7.35 7.35 0 0 0 5 9c-4 0-5 3-5 4 0 .667.333 1 1 1h4.216A2.238 2.238 0 0 1 5 13c0-1.01.377-2.042 1.09-2.904.243-.294.526-.569.846-.816zM4.92 10A5.493 5.493 0 0 0 4 13H1c0-.26.164-1.03.76-1.724.545-.636 1.492-1.256 3.16-1.275zM1.5 5.5a3 3 0 1 1 6 0 3 3 0 0 1-6 0zm3-2a2 2 0 1 0 0 4 2 2 0 0 0 0-4z"
                                                />
                                            </svg>
                                        </span>
                                        <!--end::Svg Icon-->
                                    </span>
                                    <span class="menu-title">USER</span>
                                </NavLink>
                            </div>
                            <div class="menu-item">
                                <NavLink
                                    :href="route('admin.index')"
                                    class="menu-link"
                                >
                                    <span class="menu-icon">
                                        <!--begin::Svg Icon | path: icons/duotune/communication/com001.svg-->
                                        <span class="svg-icon svg-icon-2">
                                            <svg
                                                xmlns="http://www.w3.org/2000/svg"
                                                width="16"
                                                height="16"
                                                fill="currentColor"
                                                class="bi bi-people-fill"
                                                viewBox="0 0 16 16"
                                            >
                                                <path
                                                    d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"
                                                />
                                                <path
                                                    fill-rule="evenodd"
                                                    d="M5.216 14A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216z"
                                                />
                                                <path
                                                    d="M4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5z"
                                                />
                                            </svg>
                                        </span>
                                        <!--end::Svg Icon-->
                                    </span>
                                    <span class="menu-title">ADMIN</span>
                                </NavLink>
                            </div>
                            <div class="menu-item">
                                <NavLink
                                    :href="route('room.index')"
                                    class="menu-link"
                                >
                                    <span class="menu-icon">
                                        <!--begin::Svg Icon | path: icons/duotune/communication/com001.svg-->
                                        <span class="svg-icon svg-icon-2">
                                            <svg
                                                xmlns="http://www.w3.org/2000/svg"
                                                width="16"
                                                height="16"
                                                fill="currentColor"
                                                class="bi bi-file-earmark-ruled"
                                                viewBox="0 0 16 16"
                                            >
                                                <path
                                                    d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2V9H3V2a1 1 0 0 1 1-1h5.5v2zM3 12v-2h2v2H3zm0 1h2v2H4a1 1 0 0 1-1-1v-1zm3 2v-2h7v1a1 1 0 0 1-1 1H6zm7-3H6v-2h7v2z"
                                                />
                                            </svg>
                                        </span>
                                        <!--end::Svg Icon-->
                                    </span>
                                    <span class="menu-title">ROOM</span>
                                </NavLink>
                            </div>
                            <div class="menu-item">
                                <NavLink
                                    :href="route('tipeRoom.index')"
                                    class="menu-link"
                                >
                                    <span class="menu-icon">
                                        <!--begin::Svg Icon | path: icons/duotune/communication/com001.svg-->
                                        <span class="svg-icon svg-icon-2">
                                            <svg
                                                xmlns="http://www.w3.org/2000/svg"
                                                width="16"
                                                height="16"
                                                fill="currentColor"
                                                class="bi bi-ui-radios"
                                                viewBox="0 0 16 16"
                                            >
                                                <path
                                                    d="M7 2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-7a.5.5 0 0 1-.5-.5v-1zM0 12a3 3 0 1 1 6 0 3 3 0 0 1-6 0zm7-1.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-7a.5.5 0 0 1-.5-.5v-1zm0-5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0 8a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zM3 1a3 3 0 1 0 0 6 3 3 0 0 0 0-6zm0 4.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z"
                                                />
                                            </svg>
                                        </span>
                                        <!--end::Svg Icon-->
                                    </span>
                                    <span class="menu-title">TIPE ROOM</span>
                                </NavLink>
                            </div>
                            <div class="menu-item">
                                <NavLink
                                    :href="route('fasilitas.index')"
                                    class="menu-link"
                                >
                                    <span class="menu-icon">
                                        <!--begin::Svg Icon | path: icons/duotune/communication/com001.svg-->
                                        <span class="svg-icon svg-icon-2">
                                            <svg
                                                xmlns="http://www.w3.org/2000/svg"
                                                width="16"
                                                height="16"
                                                fill="currentColor"
                                                class="bi bi-ui-checks-grid"
                                                viewBox="0 0 16 16"
                                            >
                                                <path
                                                    d="M2 10h3a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1v-3a1 1 0 0 1 1-1zm9-9h3a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-3a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zm0 9a1 1 0 0 0-1 1v3a1 1 0 0 0 1 1h3a1 1 0 0 0 1-1v-3a1 1 0 0 0-1-1h-3zm0-10a2 2 0 0 0-2 2v3a2 2 0 0 0 2 2h3a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2h-3zM2 9a2 2 0 0 0-2 2v3a2 2 0 0 0 2 2h3a2 2 0 0 0 2-2v-3a2 2 0 0 0-2-2H2zm7 2a2 2 0 0 1 2-2h3a2 2 0 0 1 2 2v3a2 2 0 0 1-2 2h-3a2 2 0 0 1-2-2v-3zM0 2a2 2 0 0 1 2-2h3a2 2 0 0 1 2 2v3a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm5.354.854a.5.5 0 1 0-.708-.708L3 3.793l-.646-.647a.5.5 0 1 0-.708.708l1 1a.5.5 0 0 0 .708 0l2-2z"
                                                />
                                            </svg>
                                        </span>
                                        <!--end::Svg Icon-->
                                    </span>
                                    <span class="menu-title">FASILITAS</span>
                                </NavLink>
                            </div>
                            <div class="menu-item">
                                <NavLink
                                    :href="route('rule.index')"
                                    class="menu-link"
                                >
                                    <span class="menu-icon">
                                        <!--begin::Svg Icon | path: icons/duotune/communication/com001.svg-->
                                        <span class="svg-icon svg-icon-2">
                                            <svg
                                                xmlns="http://www.w3.org/2000/svg"
                                                width="16"
                                                height="16"
                                                fill="currentColor"
                                                class="bi bi-file-earmark-ruled"
                                                viewBox="0 0 16 16"
                                            >
                                                <path
                                                    d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2V9H3V2a1 1 0 0 1 1-1h5.5v2zM3 12v-2h2v2H3zm0 1h2v2H4a1 1 0 0 1-1-1v-1zm3 2v-2h7v1a1 1 0 0 1-1 1H6zm7-3H6v-2h7v2z"
                                                />
                                            </svg>
                                        </span>
                                        <!--end::Svg Icon-->
                                    </span>
                                    <span class="menu-title">PERATURAN</span>
                                </NavLink>
                            </div>
                            <div class="menu-item">
                                <div class="menu-content pb-2">
                                    <span
                                        class="menu-section text-muted text-uppercase fs-8 ls-1"
                                        >TRANSAKSI</span
                                    >
                                </div>
                            </div>
                            <div class="menu-item">
                                <NavLink
                                    :href="route('user.index')"
                                    class="menu-link"
                                >
                                    <span class="menu-icon">
                                        <!--begin::Svg Icon | path: icons/duotune/communication/com001.svg-->
                                        <span class="svg-icon svg-icon-2">
                                            <svg
                                                xmlns="http://www.w3.org/2000/svg"
                                                width="16"
                                                height="16"
                                                fill="currentColor"
                                                class="bi bi-check-lg"
                                                viewBox="0 0 16 16"
                                            >
                                                <path
                                                    d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425a.247.247 0 0 1 .02-.022Z"
                                                />
                                            </svg>
                                        </span>
                                        <!--end::Svg Icon-->
                                    </span>
                                    <span class="menu-title">APPROVAL</span>
                                </NavLink>
                            </div>
                            <div class="menu-item">
                                <NavLink
                                    :href="route('user.index')"
                                    class="menu-link"
                                >
                                    <span class="menu-icon">
                                        <!--begin::Svg Icon | path: icons/duotune/communication/com001.svg-->
                                        <span class="svg-icon svg-icon-2">
                                            <svg
                                                xmlns="http://www.w3.org/2000/svg"
                                                width="16"
                                                height="16"
                                                fill="currentColor"
                                                class="bi bi-calendar-range"
                                                viewBox="0 0 16 16"
                                            >
                                                <path
                                                    d="M9 7a1 1 0 0 1 1-1h5v2h-5a1 1 0 0 1-1-1zM1 9h4a1 1 0 0 1 0 2H1V9z"
                                                />
                                                <path
                                                    d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"
                                                />
                                            </svg>
                                        </span>
                                        <!--end::Svg Icon-->
                                    </span>
                                    <span class="menu-title"
                                        >DAFTAR BOOKING</span
                                    >
                                </NavLink>
                            </div>
                            <div class="menu-item">
                                <div class="menu-content pb-2">
                                    <span
                                        class="menu-section text-muted text-uppercase fs-8 ls-1"
                                        >LAPORAN</span
                                    >
                                </div>
                            </div>
                            <div class="menu-item">
                                <NavLink
                                    :href="route('user.index')"
                                    class="menu-link"
                                >
                                    <span class="menu-icon">
                                        <!--begin::Svg Icon | path: icons/duotune/communication/com001.svg-->
                                        <span class="svg-icon svg-icon-2">
                                            <svg
                                                xmlns="http://www.w3.org/2000/svg"
                                                width="16"
                                                height="16"
                                                fill="currentColor"
                                                class="bi bi-calendar-range"
                                                viewBox="0 0 16 16"
                                            >
                                                <path
                                                    d="M9 7a1 1 0 0 1 1-1h5v2h-5a1 1 0 0 1-1-1zM1 9h4a1 1 0 0 1 0 2H1V9z"
                                                />
                                                <path
                                                    d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"
                                                />
                                            </svg>
                                        </span>
                                        <!--end::Svg Icon-->
                                    </span>
                                    <span class="menu-title">BULANAN</span>
                                </NavLink>
                            </div>
                            <!--end::Topbar-->
                        </div>
                        <!--end::Wrapper-->
                    </div>
                    <!--end::Container-->
                </div>
            </div>
            <div
                class="content d-flex flex-column flex-column-fluid"
                id="kt_content"
            >
                <!--begin::Post-->
                <div id="kt_header" class="header" style="top: -30px">
                    <!--begin::Container-->
                    <div
                        class="container-fluid d-flex align-items-stretch justify-content-between"
                        style="background-color: lightblue; margin-top: -25px"
                    >
                        <!--begin::Aside mobile toggle-->
                        <div
                            class="d-flex align-items-center d-lg-none ms-n3 me-1"
                            title="Show aside menu"
                        >
                            <div
                                class="btn btn-icon btn-active-light-primary w-30px h-30px w-md-40px h-md-40px"
                                id="kt_aside_mobile_toggle"
                            >
                                <!--begin::Svg Icon | path: icons/duotune/abstract/abs015.svg-->
                                <span class="svg-icon svg-icon-2x mt-1">
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
                                        ></path>
                                        <path
                                            opacity="0.3"
                                            d="M21 14H3C2.4 14 2 13.6 2 13V11C2 10.4 2.4 10 3 10H21C21.6 10 22 10.4 22 11V13C22 13.6 21.6 14 21 14ZM22 20V18C22 17.4 21.6 17 21 17H3C2.4 17 2 17.4 2 18V20C2 20.6 2.4 21 3 21H21C21.6 21 22 20.6 22 20Z"
                                            fill="black"
                                        ></path>
                                    </svg>
                                </span>
                                <!--end::Svg Icon-->
                            </div>
                        </div>
                        <!--end::Aside mobile toggle-->
                        <!--begin::Wrapper-->
                        <div
                            class="d-flex align-items-stretch justify-content-between flex-lg-grow-1"
                        >
                            <!--begin::Navbar-->
                            <div
                                class="d-flex align-items-stretch"
                                id="kt_header_nav"
                            >
                                <!--begin::Menu wrapper-->
                                <div
                                    class="header-menu align-items-stretch"
                                    data-kt-drawer="true"
                                    data-kt-drawer-name="header-menu"
                                    data-kt-drawer-activate="{default: true, lg: false}"
                                    data-kt-drawer-overlay="true"
                                    data-kt-drawer-width="{default:'200px', '300px': '250px'}"
                                    data-kt-drawer-direction="end"
                                    data-kt-drawer-toggle="#kt_header_menu_mobile_toggle"
                                    data-kt-swapper="true"
                                    data-kt-swapper-mode="prepend"
                                    data-kt-swapper-parent="{default: '#kt_body', lg: '#kt_header_nav'}"
                                >
                                    <!--begin::Menu-->

                                    <!--end::Menu-->
                                </div>
                                <!--end::Menu wrapper-->
                            </div>
                            <!--end::Navbar-->
                            <!--begin::Topbar-->
                            <div
                                class="d-flex align-items-stretch flex-shrink-0"
                            >
                                <!--begin::Toolbar wrapper-->
                                <div
                                    class="d-flex align-items-stretch flex-shrink-0"
                                >
                                    <!--begin::Notifications-->
                                    <div
                                        class="d-flex align-items-center ms-1 ms-lg-3"
                                    >
                                        <!--begin::Menu- wrapper-->
                                        <div
                                            class="btn btn-icon btn-active-light-primary position-relative w-30px h-30px w-md-40px h-md-40px"
                                            data-kt-menu-trigger="click"
                                            data-kt-menu-attach="parent"
                                            data-kt-menu-placement="bottom-end"
                                            @click="_notif"
                                        >
                                            <!--begin::Svg Icon | path: icons/duotune/general/gen022.svg-->
                                            <span class="svg-icon svg-icon-1">
                                                <svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    width="24"
                                                    height="24"
                                                    viewBox="0 0 24 24"
                                                    fill="none"
                                                >
                                                    <path
                                                        d="M11.2929 2.70711C11.6834 2.31658 12.3166 2.31658 12.7071 2.70711L15.2929 5.29289C15.6834 5.68342 15.6834 6.31658 15.2929 6.70711L12.7071 9.29289C12.3166 9.68342 11.6834 9.68342 11.2929 9.29289L8.70711 6.70711C8.31658 6.31658 8.31658 5.68342 8.70711 5.29289L11.2929 2.70711Z"
                                                        fill="blue"
                                                    ></path>
                                                    <path
                                                        d="M11.2929 14.7071C11.6834 14.3166 12.3166 14.3166 12.7071 14.7071L15.2929 17.2929C15.6834 17.6834 15.6834 18.3166 15.2929 18.7071L12.7071 21.2929C12.3166 21.6834 11.6834 21.6834 11.2929 21.2929L8.70711 18.7071C8.31658 18.3166 8.31658 17.6834 8.70711 17.2929L11.2929 14.7071Z"
                                                        fill="blue"
                                                    ></path>
                                                    <path
                                                        opacity="0.3"
                                                        d="M5.29289 8.70711C5.68342 8.31658 6.31658 8.31658 6.70711 8.70711L9.29289 11.2929C9.68342 11.6834 9.68342 12.3166 9.29289 12.7071L6.70711 15.2929C6.31658 15.6834 5.68342 15.6834 5.29289 15.2929L2.70711 12.7071C2.31658 12.3166 2.31658 11.6834 2.70711 11.2929L5.29289 8.70711Z"
                                                        fill="blue"
                                                    ></path>
                                                    <path
                                                        opacity="0.3"
                                                        d="M17.2929 8.70711C17.6834 8.31658 18.3166 8.31658 18.7071 8.70711L21.2929 11.2929C21.6834 11.6834 21.6834 12.3166 21.2929 12.7071L18.7071 15.2929C18.3166 15.6834 17.6834 15.6834 17.2929 15.2929L14.7071 12.7071C14.3166 12.3166 14.3166 11.6834 14.7071 11.2929L17.2929 8.70711Z"
                                                        fill="blue"
                                                    ></path>
                                                </svg>
                                            </span>
                                            <!--end::Svg Icon-->
                                        </div>
                                        <!--begin::Menu-->
                                        <div
                                            class="menu menu-sub menu-sub-dropdown menu-column w-350px w-lg-375px"
                                            data-kt-menu="true"
                                        >
                                            <!--begin::Heading-->
                                            <div
                                                class="d-flex flex-column bgi-no-repeat rounded-top"
                                                style="
                                                    background-color: #1e90ff;
                                                "
                                            >
                                                <!--begin::Title-->
                                                <h3
                                                    class="text-white fw-bold px-9 mt-10 mb-6"
                                                >
                                                    Notifications
                                                </h3>
                                                <!--end::Title-->
                                                <!--begin::Tabs-->
                                                <ul
                                                    class="nav nav-line-tabs nav-line-tabs-2x nav-stretch fw-bold px-9"
                                                >
                                                    <li class="nav-item">
                                                        <a
                                                            class="nav-link text-white opacity-75 opacity-state-100 active pb-4"
                                                            data-bs-toggle="tab"
                                                            href="#kt_topbar_notifications_1"
                                                            @click="_notif"
                                                            >Mutasi</a
                                                        >
                                                    </li>
                                                    <li class="nav-item">
                                                        <a
                                                            class="nav-link text-white opacity-75 opacity-state-100 pb-4"
                                                            data-bs-toggle="tab"
                                                            href="#kt_topbar_notifications_2"
                                                            >Pembelian</a
                                                        >
                                                    </li>
                                                    <li class="nav-item">
                                                        <a
                                                            class="nav-link text-white opacity-75 opacity-state-100 pb-4"
                                                            data-bs-toggle="tab"
                                                            href="#kt_topbar_notifications_3"
                                                            >Katalog</a
                                                        >
                                                    </li>
                                                </ul>
                                                <!--end::Tabs-->
                                            </div>
                                            <!--end::Heading-->
                                            <!--begin::Tab content-->
                                            <div class="tab-content">
                                                <!--begin::Tab panel-->
                                                <div
                                                    class="tab-pane fade show active"
                                                    id="kt_topbar_notifications_1"
                                                    role="tabpanel"
                                                >
                                                    <!--begin::Items-->
                                                    <div
                                                        class="scroll-y mh-325px my-5 px-8"
                                                    >
                                                        <!--begin::Item-->
                                                        <div
                                                            class="d-flex flex-stack py-4"
                                                            v-for="row in notifs"
                                                            :key="row.id"
                                                        >
                                                            <!--begin::Section-->
                                                            <div
                                                                class="d-flex align-items-center"
                                                            >
                                                                <!--begin::Title-->
                                                                <div
                                                                    class="mb-0 me-2"
                                                                >
                                                                    <Link
                                                                        :href="
                                                                            route(
                                                                                row.url
                                                                            )
                                                                        "
                                                                        class="fs-6 text-gray-800 text-hover-primary fw-bolder"
                                                                        >{{
                                                                            row.desc
                                                                        }}</Link
                                                                    >
                                                                    <div
                                                                        class="text-gray-400 fs-7"
                                                                    ></div>
                                                                </div>
                                                                <!--end::Title-->
                                                            </div>
                                                            <!--end::Section-->
                                                            <!--begin::Label-->
                                                            <span
                                                                class="badge badge-light fs-8"
                                                                >1 hr</span
                                                            >
                                                            <!--end::Label-->
                                                        </div>
                                                        <!--end::Item-->
                                                    </div>
                                                    <!--end::Items-->
                                                    <!--begin::View more-->
                                                    <div
                                                        class="py-3 text-center border-top"
                                                    >
                                                        <a
                                                            href="../../demo1/dist/pages/profile/activity.html"
                                                            class="btn btn-color-gray-600 btn-active-color-primary"
                                                            >View All
                                                            <!--begin::Svg Icon | path: icons/duotune/arrows/arr064.svg-->
                                                            <span
                                                                class="svg-icon svg-icon-5"
                                                            >
                                                                <svg
                                                                    xmlns="http://www.w3.org/2000/svg"
                                                                    width="24"
                                                                    height="24"
                                                                    viewBox="0 0 24 24"
                                                                    fill="none"
                                                                >
                                                                    <rect
                                                                        opacity="0.5"
                                                                        x="18"
                                                                        y="13"
                                                                        width="13"
                                                                        height="2"
                                                                        rx="1"
                                                                        transform="rotate(-180 18 13)"
                                                                        fill="black"
                                                                    ></rect>
                                                                    <path
                                                                        d="M15.4343 12.5657L11.25 16.75C10.8358 17.1642 10.8358 17.8358 11.25 18.25C11.6642 18.6642 12.3358 18.6642 12.75 18.25L18.2929 12.7071C18.6834 12.3166 18.6834 11.6834 18.2929 11.2929L12.75 5.75C12.3358 5.33579 11.6642 5.33579 11.25 5.75C10.8358 6.16421 10.8358 6.83579 11.25 7.25L15.4343 11.4343C15.7467 11.7467 15.7467 12.2533 15.4343 12.5657Z"
                                                                        fill="black"
                                                                    ></path>
                                                                </svg>
                                                            </span>
                                                            <!--end::Svg Icon--></a
                                                        >
                                                    </div>
                                                    <!--end::View more-->
                                                </div>
                                                <!--end::Tab panel-->
                                                <!--begin::Tab panel-->
                                                <div
                                                    class="tab-pane fade"
                                                    id="kt_topbar_notifications_2"
                                                    role="tabpanel"
                                                >
                                                    <!--begin::Wrapper-->
                                                    <div
                                                        class="d-flex flex-column px-9"
                                                    >
                                                        <!--begin::Section-->
                                                        <div class="pt-10 pb-0">
                                                            <!--begin::Title-->
                                                            <h3
                                                                class="text-dark text-center fw-bolder"
                                                            >
                                                                Get Pro Access
                                                            </h3>
                                                            <!--end::Title-->
                                                            <!--begin::Text-->
                                                            <div
                                                                class="text-center text-gray-600 fw-bold pt-1"
                                                            >
                                                                Outlines keep
                                                                you honest. They
                                                                stoping you from
                                                                amazing poorly
                                                                about drive
                                                            </div>
                                                            <!--end::Text-->
                                                            <!--begin::Action-->
                                                            <div
                                                                class="text-center mt-5 mb-9"
                                                            >
                                                                <a
                                                                    href="#"
                                                                    class="btn btn-sm btn-primary px-6"
                                                                    data-bs-toggle="modal"
                                                                    data-bs-target="#kt_modal_upgrade_plan"
                                                                    >Upgrade</a
                                                                >
                                                            </div>
                                                            <!--end::Action-->
                                                        </div>
                                                        <!--end::Section-->
                                                        <!--begin::Illustration-->
                                                        <div
                                                            class="text-center px-4"
                                                        >
                                                            <img
                                                                class="mw-100 mh-200px"
                                                                alt="image"
                                                                src="assets/media/illustrations/sketchy-1/1.png"
                                                            />
                                                        </div>
                                                        <!--end::Illustration-->
                                                    </div>
                                                    <!--end::Wrapper-->
                                                </div>
                                                <!--end::Tab panel-->
                                                <!--begin::Tab panel-->
                                                <div
                                                    class="tab-pane fade"
                                                    id="kt_topbar_notifications_3"
                                                    role="tabpanel"
                                                >
                                                    <!--begin::Items-->
                                                    <div
                                                        class="scroll-y mh-325px my-5 px-8"
                                                    >
                                                        <!--begin::Item-->
                                                        <div
                                                            class="d-flex flex-stack py-4"
                                                        >
                                                            <!--begin::Section-->
                                                            <div
                                                                class="d-flex align-items-center me-2"
                                                            >
                                                                <!--begin::Code-->
                                                                <span
                                                                    class="w-70px badge badge-light-success me-4"
                                                                    >200
                                                                    OK</span
                                                                >
                                                                <!--end::Code-->
                                                                <!--begin::Title-->
                                                                <a
                                                                    href="#"
                                                                    class="text-gray-800 text-hover-primary fw-bold"
                                                                    >New
                                                                    order</a
                                                                >
                                                                <!--end::Title-->
                                                            </div>
                                                            <!--end::Section-->
                                                            <!--begin::Label-->
                                                            <span
                                                                class="badge badge-light fs-8"
                                                                >Just now</span
                                                            >
                                                            <!--end::Label-->
                                                        </div>
                                                        <!--end::Item-->
                                                        <!--begin::Item-->
                                                        <div
                                                            class="d-flex flex-stack py-4"
                                                        >
                                                            <!--begin::Section-->
                                                            <div
                                                                class="d-flex align-items-center me-2"
                                                            >
                                                                <!--begin::Code-->
                                                                <span
                                                                    class="w-70px badge badge-light-danger me-4"
                                                                    >500
                                                                    ERR</span
                                                                >
                                                                <!--end::Code-->
                                                                <!--begin::Title-->
                                                                <a
                                                                    href="#"
                                                                    class="text-gray-800 text-hover-primary fw-bold"
                                                                    >New
                                                                    customer</a
                                                                >
                                                                <!--end::Title-->
                                                            </div>
                                                            <!--end::Section-->
                                                            <!--begin::Label-->
                                                            <span
                                                                class="badge badge-light fs-8"
                                                                >2 hrs</span
                                                            >
                                                            <!--end::Label-->
                                                        </div>
                                                        <!--end::Item-->
                                                        <!--begin::Item-->
                                                        <div
                                                            class="d-flex flex-stack py-4"
                                                        >
                                                            <!--begin::Section-->
                                                            <div
                                                                class="d-flex align-items-center me-2"
                                                            >
                                                                <!--begin::Code-->
                                                                <span
                                                                    class="w-70px badge badge-light-success me-4"
                                                                    >200
                                                                    OK</span
                                                                >
                                                                <!--end::Code-->
                                                                <!--begin::Title-->
                                                                <a
                                                                    href="#"
                                                                    class="text-gray-800 text-hover-primary fw-bold"
                                                                    >Payment
                                                                    process</a
                                                                >
                                                                <!--end::Title-->
                                                            </div>
                                                            <!--end::Section-->
                                                            <!--begin::Label-->
                                                            <span
                                                                class="badge badge-light fs-8"
                                                                >5 hrs</span
                                                            >
                                                            <!--end::Label-->
                                                        </div>
                                                        <!--end::Item-->
                                                        <!--begin::Item-->
                                                        <div
                                                            class="d-flex flex-stack py-4"
                                                        >
                                                            <!--begin::Section-->
                                                            <div
                                                                class="d-flex align-items-center me-2"
                                                            >
                                                                <!--begin::Code-->
                                                                <span
                                                                    class="w-70px badge badge-light-warning me-4"
                                                                    >300
                                                                    WRN</span
                                                                >
                                                                <!--end::Code-->
                                                                <!--begin::Title-->
                                                                <a
                                                                    href="#"
                                                                    class="text-gray-800 text-hover-primary fw-bold"
                                                                    >Search
                                                                    query</a
                                                                >
                                                                <!--end::Title-->
                                                            </div>
                                                            <!--end::Section-->
                                                            <!--begin::Label-->
                                                            <span
                                                                class="badge badge-light fs-8"
                                                                >2 days</span
                                                            >
                                                            <!--end::Label-->
                                                        </div>
                                                        <!--end::Item-->
                                                        <!--begin::Item-->
                                                        <div
                                                            class="d-flex flex-stack py-4"
                                                        >
                                                            <!--begin::Section-->
                                                            <div
                                                                class="d-flex align-items-center me-2"
                                                            >
                                                                <!--begin::Code-->
                                                                <span
                                                                    class="w-70px badge badge-light-success me-4"
                                                                    >200
                                                                    OK</span
                                                                >
                                                                <!--end::Code-->
                                                                <!--begin::Title-->
                                                                <a
                                                                    href="#"
                                                                    class="text-gray-800 text-hover-primary fw-bold"
                                                                    >API
                                                                    connection</a
                                                                >
                                                                <!--end::Title-->
                                                            </div>
                                                            <!--end::Section-->
                                                            <!--begin::Label-->
                                                            <span
                                                                class="badge badge-light fs-8"
                                                                >1 week</span
                                                            >
                                                            <!--end::Label-->
                                                        </div>
                                                        <!--end::Item-->
                                                        <!--begin::Item-->
                                                        <div
                                                            class="d-flex flex-stack py-4"
                                                        >
                                                            <!--begin::Section-->
                                                            <div
                                                                class="d-flex align-items-center me-2"
                                                            >
                                                                <!--begin::Code-->
                                                                <span
                                                                    class="w-70px badge badge-light-success me-4"
                                                                    >200
                                                                    OK</span
                                                                >
                                                                <!--end::Code-->
                                                                <!--begin::Title-->
                                                                <a
                                                                    href="#"
                                                                    class="text-gray-800 text-hover-primary fw-bold"
                                                                    >Database
                                                                    restore</a
                                                                >
                                                                <!--end::Title-->
                                                            </div>
                                                            <!--end::Section-->
                                                            <!--begin::Label-->
                                                            <span
                                                                class="badge badge-light fs-8"
                                                                >Mar 5</span
                                                            >
                                                            <!--end::Label-->
                                                        </div>
                                                        <!--end::Item-->
                                                        <!--begin::Item-->
                                                        <div
                                                            class="d-flex flex-stack py-4"
                                                        >
                                                            <!--begin::Section-->
                                                            <div
                                                                class="d-flex align-items-center me-2"
                                                            >
                                                                <!--begin::Code-->
                                                                <span
                                                                    class="w-70px badge badge-light-warning me-4"
                                                                    >300
                                                                    WRN</span
                                                                >
                                                                <!--end::Code-->
                                                                <!--begin::Title-->
                                                                <a
                                                                    href="#"
                                                                    class="text-gray-800 text-hover-primary fw-bold"
                                                                    >System
                                                                    update</a
                                                                >
                                                                <!--end::Title-->
                                                            </div>
                                                            <!--end::Section-->
                                                            <!--begin::Label-->
                                                            <span
                                                                class="badge badge-light fs-8"
                                                                >May 15</span
                                                            >
                                                            <!--end::Label-->
                                                        </div>
                                                        <!--end::Item-->
                                                        <!--begin::Item-->
                                                        <div
                                                            class="d-flex flex-stack py-4"
                                                        >
                                                            <!--begin::Section-->
                                                            <div
                                                                class="d-flex align-items-center me-2"
                                                            >
                                                                <!--begin::Code-->
                                                                <span
                                                                    class="w-70px badge badge-light-warning me-4"
                                                                    >300
                                                                    WRN</span
                                                                >
                                                                <!--end::Code-->
                                                                <!--begin::Title-->
                                                                <a
                                                                    href="#"
                                                                    class="text-gray-800 text-hover-primary fw-bold"
                                                                    >Server OS
                                                                    update</a
                                                                >
                                                                <!--end::Title-->
                                                            </div>
                                                            <!--end::Section-->
                                                            <!--begin::Label-->
                                                            <span
                                                                class="badge badge-light fs-8"
                                                                >Apr 3</span
                                                            >
                                                            <!--end::Label-->
                                                        </div>
                                                        <!--end::Item-->
                                                        <!--begin::Item-->
                                                        <div
                                                            class="d-flex flex-stack py-4"
                                                        >
                                                            <!--begin::Section-->
                                                            <div
                                                                class="d-flex align-items-center me-2"
                                                            >
                                                                <!--begin::Code-->
                                                                <span
                                                                    class="w-70px badge badge-light-warning me-4"
                                                                    >300
                                                                    WRN</span
                                                                >
                                                                <!--end::Code-->
                                                                <!--begin::Title-->
                                                                <a
                                                                    href="#"
                                                                    class="text-gray-800 text-hover-primary fw-bold"
                                                                    >API
                                                                    rollback</a
                                                                >
                                                                <!--end::Title-->
                                                            </div>
                                                            <!--end::Section-->
                                                            <!--begin::Label-->
                                                            <span
                                                                class="badge badge-light fs-8"
                                                                >Jun 30</span
                                                            >
                                                            <!--end::Label-->
                                                        </div>
                                                        <!--end::Item-->
                                                        <!--begin::Item-->
                                                        <div
                                                            class="d-flex flex-stack py-4"
                                                        >
                                                            <!--begin::Section-->
                                                            <div
                                                                class="d-flex align-items-center me-2"
                                                            >
                                                                <!--begin::Code-->
                                                                <span
                                                                    class="w-70px badge badge-light-danger me-4"
                                                                    >500
                                                                    ERR</span
                                                                >
                                                                <!--end::Code-->
                                                                <!--begin::Title-->
                                                                <a
                                                                    href="#"
                                                                    class="text-gray-800 text-hover-primary fw-bold"
                                                                    >Refund
                                                                    process</a
                                                                >
                                                                <!--end::Title-->
                                                            </div>
                                                            <!--end::Section-->
                                                            <!--begin::Label-->
                                                            <span
                                                                class="badge badge-light fs-8"
                                                                >Jul 10</span
                                                            >
                                                            <!--end::Label-->
                                                        </div>
                                                        <!--end::Item-->
                                                        <!--begin::Item-->
                                                        <div
                                                            class="d-flex flex-stack py-4"
                                                        >
                                                            <!--begin::Section-->
                                                            <div
                                                                class="d-flex align-items-center me-2"
                                                            >
                                                                <!--begin::Code-->
                                                                <span
                                                                    class="w-70px badge badge-light-danger me-4"
                                                                    >500
                                                                    ERR</span
                                                                >
                                                                <!--end::Code-->
                                                                <!--begin::Title-->
                                                                <a
                                                                    href="#"
                                                                    class="text-gray-800 text-hover-primary fw-bold"
                                                                    >Withdrawal
                                                                    process</a
                                                                >
                                                                <!--end::Title-->
                                                            </div>
                                                            <!--end::Section-->
                                                            <!--begin::Label-->
                                                            <span
                                                                class="badge badge-light fs-8"
                                                                >Sep 10</span
                                                            >
                                                            <!--end::Label-->
                                                        </div>
                                                        <!--end::Item-->
                                                        <!--begin::Item-->
                                                        <div
                                                            class="d-flex flex-stack py-4"
                                                        >
                                                            <!--begin::Section-->
                                                            <div
                                                                class="d-flex align-items-center me-2"
                                                            >
                                                                <!--begin::Code-->
                                                                <span
                                                                    class="w-70px badge badge-light-danger me-4"
                                                                    >500
                                                                    ERR</span
                                                                >
                                                                <!--end::Code-->
                                                                <!--begin::Title-->
                                                                <a
                                                                    href="#"
                                                                    class="text-gray-800 text-hover-primary fw-bold"
                                                                    >Mail
                                                                    tasks</a
                                                                >
                                                                <!--end::Title-->
                                                            </div>
                                                            <!--end::Section-->
                                                            <!--begin::Label-->
                                                            <span
                                                                class="badge badge-light fs-8"
                                                                >Dec 10</span
                                                            >
                                                            <!--end::Label-->
                                                        </div>
                                                        <!--end::Item-->
                                                    </div>
                                                    <!--end::Items-->
                                                    <!--begin::View more-->
                                                    <div
                                                        class="py-3 text-center border-top"
                                                    >
                                                        <a
                                                            href="../../demo1/dist/pages/profile/activity.html"
                                                            class="btn btn-color-gray-600 btn-active-color-primary"
                                                            >View All
                                                            <!--begin::Svg Icon | path: icons/duotune/arrows/arr064.svg-->
                                                            <span
                                                                class="svg-icon svg-icon-5"
                                                            >
                                                                <svg
                                                                    xmlns="http://www.w3.org/2000/svg"
                                                                    width="24"
                                                                    height="24"
                                                                    viewBox="0 0 24 24"
                                                                    fill="none"
                                                                >
                                                                    <rect
                                                                        opacity="0.5"
                                                                        x="18"
                                                                        y="13"
                                                                        width="13"
                                                                        height="2"
                                                                        rx="1"
                                                                        transform="rotate(-180 18 13)"
                                                                        fill="black"
                                                                    ></rect>
                                                                    <path
                                                                        d="M15.4343 12.5657L11.25 16.75C10.8358 17.1642 10.8358 17.8358 11.25 18.25C11.6642 18.6642 12.3358 18.6642 12.75 18.25L18.2929 12.7071C18.6834 12.3166 18.6834 11.6834 18.2929 11.2929L12.75 5.75C12.3358 5.33579 11.6642 5.33579 11.25 5.75C10.8358 6.16421 10.8358 6.83579 11.25 7.25L15.4343 11.4343C15.7467 11.7467 15.7467 12.2533 15.4343 12.5657Z"
                                                                        fill="black"
                                                                    ></path>
                                                                </svg>
                                                            </span>
                                                            <!--end::Svg Icon--></a
                                                        >
                                                    </div>
                                                    <!--end::View more-->
                                                </div>
                                                <!--end::Tab panel-->
                                            </div>
                                            <!--end::Tab content-->
                                        </div>
                                        <!--end::Menu-->
                                        <!--end::Menu wrapper-->
                                    </div>
                                    <!--end::Notifications-->
                                    <!--begin::User-->
                                    <div
                                        class="d-flex align-items-center ms-1 ms-lg-3"
                                        id="kt_header_user_menu_toggle"
                                    >
                                        <!--begin::Menu wrapper-->
                                        <div
                                            class="cursor-pointer symbol symbol-30px symbol-md-40px"
                                            data-kt-menu-trigger="click"
                                            data-kt-menu-attach="parent"
                                            data-kt-menu-placement="bottom-end"
                                        >
                                            {{ user.nama }}
                                        </div>
                                        <!--begin::Menu-->
                                        <div
                                            class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-800 menu-state-bg menu-state-primary fw-bold py-4 fs-6 w-275px"
                                            data-kt-menu="true"
                                        >
                                            <!--end::Menu item-->
                                            <!--begin::Menu item-->
                                            <div class="menu-item px-5">
                                                <Link
                                                    :href="route('logout')"
                                                    class="menu-link px-5"
                                                    >Sign Out</Link
                                                >
                                            </div>
                                            <!--end::Menu item-->
                                        </div>
                                        <!--end::Menu-->
                                        <!--end::Menu wrapper-->
                                    </div>
                                    <!--end::User -->
                                    <!--begin::Heaeder menu toggle-->
                                    <div
                                        class="d-flex align-items-center d-lg-none ms-2 me-n3"
                                        title="Show header menu"
                                    >
                                        <div
                                            class="btn btn-icon btn-active-light-primary w-30px h-30px w-md-40px h-md-40px"
                                            id="kt_header_menu_mobile_toggle"
                                        >
                                            <!--begin::Svg Icon | path: icons/duotune/text/txt001.svg-->
                                            <span class="svg-icon svg-icon-1">
                                                <svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    width="24"
                                                    height="24"
                                                    viewBox="0 0 24 24"
                                                    fill="none"
                                                >
                                                    <path
                                                        d="M13 11H3C2.4 11 2 10.6 2 10V9C2 8.4 2.4 8 3 8H13C13.6 8 14 8.4 14 9V10C14 10.6 13.6 11 13 11ZM22 5V4C22 3.4 21.6 3 21 3H3C2.4 3 2 3.4 2 4V5C2 5.6 2.4 6 3 6H21C21.6 6 22 5.6 22 5Z"
                                                        fill="black"
                                                    ></path>
                                                    <path
                                                        opacity="0.3"
                                                        d="M21 16H3C2.4 16 2 15.6 2 15V14C2 13.4 2.4 13 3 13H21C21.6 13 22 13.4 22 14V15C22 15.6 21.6 16 21 16ZM14 20V19C14 18.4 13.6 18 13 18H3C2.4 18 2 18.4 2 19V20C2 20.6 2.4 21 3 21H13C13.6 21 14 20.6 14 20Z"
                                                        fill="black"
                                                    ></path>
                                                </svg>
                                            </span>
                                            <!--end::Svg Icon-->
                                        </div>
                                    </div>
                                    <!--end::Heaeder menu toggle-->
                                </div>
                                <!--end::Toolbar wrapper-->
                            </div>
                            <!--end::Topbar-->
                        </div>
                        <!--end::Wrapper-->
                    </div>
                    <!--end::Container-->
                </div>
                <div class="post d-flex flex-column-fluid" id="kt_post">
                    <!--begin::Container-->
                    <div id="kt_content_container" class="container-xl">
                        <slot />
                    </div>
                    <!--end::Container-->
                </div>
                <!--end::Post-->
            </div>
        </div>
        <!--end::Page-->
    </div>
    <!--end::Root-->
    <!--begin::Drawers-->
    <!--begin::Activities drawer-->

    <!--end::Activities drawer-->
    <!--begin::Scrolltop-->
    <div id="kt_scrolltop" class="scrolltop" data-kt-scrolltop="true">
        <!--begin::Svg Icon | path: icons/duotune/arrows/arr066.svg-->
        <span class="svg-icon">
            <svg
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                viewBox="0 0 24 24"
                fill="none"
            >
                <rect
                    opacity="0.5"
                    x="13"
                    y="6"
                    width="13"
                    height="2"
                    rx="1"
                    transform="rotate(90 13 6)"
                    fill="black"
                />
                <path
                    d="M12.5657 8.56569L16.75 12.75C17.1642 13.1642 17.8358 13.1642 18.25 12.75C18.6642 12.3358 18.6642 11.6642 18.25 11.25L12.7071 5.70711C12.3166 5.31658 11.6834 5.31658 11.2929 5.70711L5.75 11.25C5.33579 11.6642 5.33579 12.3358 5.75 12.75C6.16421 13.1642 6.83579 13.1642 7.25 12.75L11.4343 8.56569C11.7467 8.25327 12.2533 8.25327 12.5657 8.56569Z"
                    fill="black"
                />
            </svg>
        </span>
        <!--end::Svg Icon-->
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
    },

    methods: {
        _notif() {
            // this.notifs = [];
            // axios
            //     .get(route("myNotif", this.$attrs.auth.user.id))
            //     .then((response) => {
            //         this.notifs = response.data;
            //         // console.log(response.data);
            //     });
        },
    },
};
</script>
