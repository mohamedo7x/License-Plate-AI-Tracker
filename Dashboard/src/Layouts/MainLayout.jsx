import React from 'react'
import { Outlet } from 'react-router-dom'
import SideBar from '../Components/Sidebar/SideBar'
import Header from '../Components/Header/Header'

export default function MainLayout() {

    return <React.Fragment>

        <section className='w-full h-screen flex flex-wrap'>

            <nav className='w-72 h-full bg-[var(--white-color)] shadow-[0_0px_10px_var(--gray-color-3)]'>
                <SideBar />
            </nav>

            <section className='dashboard_width h-full overflow-hidden'>

                <header className='h-[4.375rem] w-full bg-[var(--white-color)] shadow-[0_0px_10px_var(--gray-color-3)]'>
                    <Header />
                </header>

                <main className='page_height w-full px-[4.5%] py-10 overflow-x-hidden overflow-y-auto'>
                    <Outlet />
                </main>

            </section>

        </section>

    </React.Fragment>

}
