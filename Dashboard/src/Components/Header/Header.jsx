import React from 'react';
import { IoIosSearch } from 'react-icons/io';

import pfpImg from '../../assets/Images/pfp.jpg';
import { Link } from 'react-router-dom';

export default function Header() {

    return <React.Fragment>

        <div className='w-full h-full px-[4.5%] py-4 flex items-center justify-between '>

            <form className='
                w-80 h-full flex items-center gap-2.5 p-2.5
                rounded-md border border-solid border-[var(--gray-color)]
            '>
                <label className='text-2xl text-[var(--gray-color)]' htmlFor="search"><IoIosSearch /></label>
                <input 
                    className='
                        w-full text-base text-[var(--black-color)] placeholder:text-[var(--gray-color)] outline-0
                    '
                    type="text" placeholder='Search...' 
                />
            </form>

            <Link className='flex items-center gap-5'>
                <p className='text-base text-[var(--gray-color-2)]'>Omar Khaled</p>
                <img className='w-9 h-9 rounded-full object-cover' src={pfpImg} alt={"pfpImg"} />
            </Link>

        </div>

    </React.Fragment>

}
