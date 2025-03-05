import React, { useCallback, useEffect, useMemo, useRef, useState } from 'react';
import { CiFilter } from 'react-icons/ci';
import { IoIosArrowForward } from 'react-icons/io';
import { AnimatePresence, motion } from 'framer-motion';
import Animations from '../../Animations/Animations';
import OfficersData from '../../assets/Data/Officers.json';
import { PropTypes } from 'prop-types';

export default function Filter({icon, filterType, data, setDataFiltered}) {

    const [displayList, setDisplayList] = useState(false);
    const [selectedType, setSelectedType] = useState(data[0]);
    const ulRef = useRef(null);

    const handleClickOutside = useCallback((event) => {

        if (ulRef.current && !ulRef.current.contains(event.target)) {
            setDisplayList(false);
        }

    }, []);

    useEffect(() => {

        document.addEventListener('mousedown', handleClickOutside);

        return () => {
            document.removeEventListener('mousedown', handleClickOutside);
        };

    }, [handleClickOutside]);

    const handleSelectType = (type) => {

        if(type !== data[0]){
            setDataFiltered(OfficersData.filter(items => items[filterType] === type));
        }
        else{
            setDataFiltered(OfficersData)
        }

        setSelectedType(type);
        setDisplayList(false);

    }

    return <React.Fragment>

        <div ref={ulRef} className='
            relative rounded-md bg-[var(--white-color)] text-base font-medium text-[var(--black-color)]
            shadow-[0_0px_10px_var(--gray-color-3)]
        '>

            <div 
                onClick={() => setDisplayList(prev => !prev)} 
                className='h-12 px-5 py-2.5 flex items-center justify-between gap-2.5 cursor-pointer'
            >
                {icon}
                <p>{selectedType}</p>
                <IoIosArrowForward className={`text-2xl duration-300 text-[var(--gray-color-2)] ${displayList ? 'rotate-90' : ''}`} />
            </div>

            <AnimatePresence>
                {displayList && 
                    <motion.ul 
                        variants={Animations.displayList} initial='hidden' animate='visible' exit={'exit'} 
                        className='
                            absolute left-0 top-14 w-full max-h-80 overflow-y-auto bg-[var(--white-color)]
                            rounded-md shadow-[0_0px_10px_var(--gray-color-3)] z-20
                        '
                    >
                        {data.map((type, idx)=> (
                            <li 
                                onClick={() => handleSelectType(type)} key={idx} 
                                className={`
                                    w-full px-5 py-2.5 flex items-center justify-center text-center text-base font-medium 
                                    border-b border-solid border-[var(--gray-color-1)] last:border-0 
                                    cursor-pointer duration-300 hover:bg-[var(--blue-color)] 
                                    hover:text-[var(--white-color)] 
                                    ${selectedType === type ? 
                                        'bg-[var(--blue-color)] text-[var(--white-color)]' 
                                        : 'bg-[var(--white-color)] text-[var(--gray-color-2)]'
                                    }`}
                            >{type}</li>
                        ))}
                    </motion.ul>
                }
            </AnimatePresence>

        </div>

    </React.Fragment>

}

Filter.propTypes = {
    data: PropTypes.array.isRequired,
    icon: PropTypes.func.isRequired,
    setDataFiltered: PropTypes.func.isRequired,
    filterType: PropTypes.string.isRequired,
};