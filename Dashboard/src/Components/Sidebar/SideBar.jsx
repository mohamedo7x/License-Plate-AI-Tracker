import React from 'react';
import { Link, NavLink } from 'react-router-dom';

import logo from '../../assets/Images/logo.png'
import { GoHome } from 'react-icons/go';
import { MdElectricBolt } from 'react-icons/md';
import { IoSettingsOutline, IoWarningOutline } from 'react-icons/io5';
import { HiOutlineDocumentReport } from 'react-icons/hi';
import { LuClipboardList, LuUsers } from 'react-icons/lu';

export default function SideBar() {

    const links = [

        {id: 1, icon: <GoHome className='text-xl' />, link: '/', title: 'Home'},
        {id: 2, icon: <MdElectricBolt className='text-xl' />, link: '/V-Management', title: 'Vehicle Management'},
        {id: 3, icon: <IoWarningOutline className='text-xl' />, link: '/W-Vehicle', title: 'Wanted Vehicle'},
        {id: 4, icon: <LuUsers className='text-xl' />, link: '/officers', title: 'Officers'},
        {id: 5, icon: <HiOutlineDocumentReport className='text-xl' />, link: '/V-Reports', title: 'Violation Reports'},
        {id: 6, icon: <LuClipboardList className='text-xl' />, link: '/adult-logs', title: 'Adult Logs'},
        {id: 7, icon: <IoSettingsOutline className='text-xl' />, link: '/setting', title: 'Setting'},

    ];

    return <React.Fragment>

        <div className='w-full h-full py-5 px-5'>

            <Link className='w-full flex justify-center pb-2.5' to={'/'}>
                <img className='h-16 pointer-events-none' src={logo} alt="logo" />
            </Link>

            <ul className='w-full py-5 flex flex-col gap-2.5'>

                {links.map(link => <li key={link.id} className='w-full'>
                    <NavLink to={link.link} className='
                        w-full py-2.5 px-5 flex items-center gap-2.5 text-[var(--gray-color-2)]
                        rounded-md text-base duration-300
                        hover:bg-[var(--blue-color)] hover:text-[var(--white-color)]
                    '>
                        {link.icon}
                        <p className='font-medium'>{link.title}</p>
                    </NavLink>
                </li>)}

            </ul>

        </div>

    </React.Fragment>

}
