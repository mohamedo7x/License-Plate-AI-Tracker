import React, { useEffect, useState } from 'react'
import Filter from '../../Components/Filter-Button/Filter'
import { FiEdit } from 'react-icons/fi';
import { IoIosArrowForward, IoIosInformationCircleOutline } from 'react-icons/io';
import { Link } from 'react-router-dom';
import { IoBanSharp, IoLocationOutline } from 'react-icons/io5';
import VehicleData from '../../assets/Data/VehicleData.json';
import { MdSecurity } from 'react-icons/md';
import { useTranslation } from 'react-i18next';

export default function VehicleM() {

    const {t, i18n} = useTranslation();

    // ====== filters-data ====== //

    const [dataFiltered, setDataFiltered] = useState('');
    const [filteredType, setFilteredType] = useState(null);
    const [filteredArray, setFilteredArray] = useState(VehicleData);

    const statusFilter = ['allStatusWord', ...new Set(VehicleData.map(item => item.status))];

    const locationFilter = ['allLocationsWord', ...new Set(VehicleData.map(item => item.location))];

    const violationsFilter = ['allViolationsWord', ...new Set(VehicleData.map(item => item.violations))];

    useEffect(() => {

        if(dataFiltered.length > 0 && filteredType){
            setFilteredArray(VehicleData.filter(items => items[filteredType] === dataFiltered))
        } else{
            setFilteredArray(VehicleData);
        }

    }, [dataFiltered]);

    return <React.Fragment>

        <section className='w-full flex flex-col gap-5'>

            <div>
                <h3 className='text-4xl font-medium text-[var(--black-color)]'>{t('vehicleManagementWord')}</h3>
                <p className='pt-0.5 text-base text-[var(--gray-color-2)]'>{t('vmSlogan')}</p>
            </div>

            <div className='w-full flex items-center justify-end gap-5'>

                <Filter 
                    icon={<IoLocationOutline className='text-2xl text-[var(--gray-color-2)]' />} 
                    data={locationFilter} setDataFiltered={setDataFiltered} 
                    setFilteredType={setFilteredType} filterType={'location'}
                />

                <Filter 
                    icon={<IoIosInformationCircleOutline className='text-2xl text-[var(--gray-color-2)]' />} 
                    data={violationsFilter} setDataFiltered={setDataFiltered} 
                    setFilteredType={setFilteredType} filterType={'violations'}
                />

                <Filter 
                    icon={<MdSecurity className='text-2xl text-[var(--gray-color-2)]' />} 
                    data={statusFilter} setDataFiltered={setDataFiltered} 
                    setFilteredType={setFilteredType} filterType={'status'}
                />

            </div>

            <div className='w-full p-2.5 rounded-md bg-[var(--white-color)] shadow-[0_0px_10px_var(--gray-color-3)]'>

                <table className='w-full border-collapse'>

                    <thead>

                        <tr className="text-base text-[var(--black-color)] text-center">

                            <th className="px-5 py-2.5">{t('plateNumWord')}</th>
                            <th className="px-5 py-2.5">{t('ownerNameWord')}</th>
                            <th className="px-5 py-2.5">{t('locationWord')}</th>
                            <th className="px-5 py-2.5">{t('violationWord')}</th>
                            <th className="px-5 py-2.5">{t('statusWord')}</th>
                            <th className="px-5 py-2.5">{t('actionsWord')}</th>

                        </tr>

                    </thead>

                    <tbody>

                        {filteredArray.map(officer => <tr key={officer.id} className='
                            border-t border-solid border-[var(--gray-color-1)]
                            text-base font-normal text-[var(--gray-color-2)] text-center
                        '>

                            <td className='py-2.5'>{officer.plateNum}</td>
                            <td className='py-2.5'>{officer.owner}</td>
                            <td className='py-2.5'>{officer.location}</td>
                            <td className='py-2.5'>
                                <Link className='flex items-center justify-center gap-1 cursor-pointer text-[var(--blue-color)]'>
                                    <p>{officer.violations}</p>
                                    <IoIosArrowForward className={`${i18n.language === 'ar' ? 'rotate-y-180' : ''}`} />
                                </Link>
                            </td>
                            <td className='py-2.5'>
                                {officer.status === 'Wanted' && 
                                    <p className='font-medium text-[var(--red-color)]'>{officer.status}</p>
                                }
                                {officer.status === 'Impounded' &&
                                    <p className='font-medium opacity-55'>{officer.status}</p>
                                }
                            </td>
                            <td className='py-2.5'>
                                <div className='flex items-center justify-center gap-2.5'>

                                    <button className='
                                        p-2.5 rounded-md bg-[var(--gray-color-3)]
                                        text-[var(--blue-color)] cursor-pointer duration-300
                                        hover:bg-[var(--blue-color)] hover:text-[var(--white-color)]
                                    '><FiEdit /></button>

                                    <button className='
                                        p-2.5 rounded-md bg-[var(--gray-color-3)]
                                        text-[var(--red-color)] cursor-pointer duration-300
                                        hover:bg-[var(--red-color)] hover:text-[var(--white-color)]
                                    '><IoBanSharp /></button>

                                </div>
                            </td>

                        </tr>)}

                    </tbody>

                </table>

            </div>

        </section>

    </React.Fragment>

}
