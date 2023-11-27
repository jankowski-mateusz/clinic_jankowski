doctor1 = Doctor.find_or_create_by!(first_name: 'Mateusz', last_name: 'Adamczyk')
doctor2 = Doctor.find_or_create_by!(first_name: 'Kacper', last_name: 'Borecki')
doctor3 = Doctor.find_or_create_by!(first_name: 'Natalia', last_name: 'Nita')

patient1 = Patient.find_or_create_by!(first_name: 'Kamil', last_name: 'Adamczyk', pesel: '54011465384', city: 'BYDGOSZCZ')
patient2 = Patient.find_or_create_by!(first_name: 'Oliwia', last_name: 'Węcławska', pesel: '54011465389', city: 'BYDGOSZCZ')
patient3 = Patient.find_or_create_by!(first_name: 'Mikołaj', last_name: 'Kacpeczyk', pesel: '54011465386', city: 'BYDGOSZCZ')


Appointment.find_or_create_by!(appointment_time: Date.today, price: 50, patient: patient1, doctor: doctor1)
Appointment.find_or_create_by!(appointment_time: Date.tomorrow, price: 70, patient: patient2, doctor: doctor2)
Appointment.find_or_create_by!(appointment_time: Date.tomorrow + 1.day, price: 100, patient: patient3, doctor: doctor3)
