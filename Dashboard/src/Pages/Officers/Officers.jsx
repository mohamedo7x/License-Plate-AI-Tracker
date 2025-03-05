import React, { useState } from 'react'
import Filter from '../../Components/Filter-Button/Filter'
import { FiEdit } from 'react-icons/fi';
import { IoIosArrowForward, IoMdWifi } from 'react-icons/io';
import { Link } from 'react-router-dom';
import { IoLocationOutline } from 'react-icons/io5';
import { GiRank3 } from 'react-icons/gi';
import OfficersData from '../../assets/Data/Officers.json';

export default function Officers() {

    // ====== filters-data ====== //

    const [dataFiltered, setDataFiltered] = useState(OfficersData);

    const statusFilter = ['All Status', ...new Set(OfficersData.map(item => item.status))];

    const locationFilter = ['All Locations', ...new Set(OfficersData.map(item => item.location))];

    const rankFilter = ['All Ranks', ...new Set(OfficersData.map(item => item.rank))];

    return <React.Fragment>

        <section className='w-full flex flex-col gap-5'>

            <div>
                <h3 className='text-4xl font-medium text-[var(--black-color)]'>Officers Management</h3>
                <p className='pt-0.5 text-base text-[var(--gray-color-2)]'>Manage and monitor officer activities</p>
            </div>

            <div className='w-full flex items-center justify-end gap-5'>

                <Filter 
                    icon={<IoLocationOutline className='text-2xl text-[var(--gray-color-2)]' />} 
                    data={locationFilter} setDataFiltered={setDataFiltered} filterType={'location'}
                />

                <Filter 
                    icon={<GiRank3 className='text-2xl text-[var(--gray-color-2)]' />} 
                    data={rankFilter} setDataFiltered={setDataFiltered} filterType={'rank'}
                />

                <Filter 
                    icon={<IoMdWifi className='text-2xl text-[var(--gray-color-2)]' />} 
                    data={statusFilter} setDataFiltered={setDataFiltered} filterType={'status'}
                />

            </div>

            <div className='w-full p-2.5 rounded-md bg-[var(--white-color)] shadow-[0_0px_10px_var(--gray-color-3)]'>

                <table className='w-full border-collapse'>

                    <thead>

                        <tr className="text-base text-[var(--black-color)] text-center">

                            <th className="px-5 py-2.5">Officer</th>
                            <th className="px-5 py-2.5">Location</th>
                            <th className="px-5 py-2.5">Rank</th>
                            <th className="px-5 py-2.5">Violations</th>
                            <th className="px-5 py-2.5">Status</th>
                            <th className="px-5 py-2.5">Actions</th>

                        </tr>

                    </thead>

                    <tbody>

                        {dataFiltered.map(officer => <tr key={officer.id} className='
                            border-t border-solid border-[var(--gray-color-1)]
                            text-base font-normal text-[var(--gray-color-2)] text-center
                        '>

                            <td className='py-2.5'>{officer.name}</td>
                            <td className='py-2.5'>{officer.location}</td>
                            <td className='py-2.5'>{officer.rank}</td>
                            <td className='py-2.5'>
                                <Link className='flex items-center justify-center gap-1 cursor-pointer text-[var(--blue-color)]'>
                                    <p>{officer.violations}</p>
                                    <IoIosArrowForward />
                                </Link>
                            </td>
                            <td className='py-2.5'>
                                {officer.status === 'Online' && 
                                    <p className='font-medium text-[var(--green-color)]'>{officer.status}</p>
                                }
                                {officer.status === 'Offline' &&
                                    <p className='font-medium opacity-55'>{officer.status}</p>
                                }
                            </td>
                            <td className='py-2.5'>
                                <button className='
                                    p-2.5 rounded-md bg-[var(--gray-color-1)]
                                    text-[var(--blue-color)] cursor-pointer duration-300
                                    hover:bg-[var(--blue-color)] hover:text-[var(--white-color)]
                                '><FiEdit /></button>
                            </td>

                        </tr>)}

                    </tbody>

                </table>

            </div>

        </section>

    </React.Fragment>

}
