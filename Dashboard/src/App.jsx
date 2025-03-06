import React, { useEffect } from 'react';
import { createBrowserRouter, RouterProvider } from 'react-router-dom';
import MainLayout from './Layouts/MainLayout';
import Home from './Pages/Home/Home';
import Officers from './Pages/Officers/Officers';
import VehicleM from './Pages/Vehicle-Management/VehicleM';
import { useTranslation } from 'react-i18next';

const routes = createBrowserRouter([

    {path: '/', element: <MainLayout />, children: [

        {path: '/', element: <Home />},
        {path: '/officers', element: <Officers />},
        {path: '/V-Management', element: <VehicleM />},

    ]}

]);

export default function App() {

    const {i18n} = useTranslation();

    // ====== save-language ====== //

    useEffect(() => {

        const savedLang = localStorage.getItem('language');

        if(savedLang && i18n.language !== savedLang){
            i18n.changeLanguage(savedLang);
        }

        document.documentElement.lang = i18n.language;
        document.documentElement.dir = i18n.language === 'ar' ? 'rtl' : 'ltr';

    }, [i18n , i18n.language]);

    return <React.Fragment>

        <RouterProvider router={routes} />

    </React.Fragment>

}