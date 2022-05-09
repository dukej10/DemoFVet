getInfoHV() async {
  bool validate = _formState.currentState!.saveAndValidate();
  if (validate) {
    final values = _formState.currentState!.value;

    //Identificación historia clinica
    final numberCH = values['numberC'];
    final date = values['date'];
    final time = values['time'];

    //Datos del propietario
    final docOwner = values['docOwner'];
    final nameOwner = values['nameOwner'];
    final contactOwner = values['contactOwner'];
    final addressOwner = int.parse(values['addressOwner']);
    final phoneNumberOwner = values['phoneNumberOwner'];
    final emailAddressOwner = values['emailAddressOwner'];

    //Reseña
    final name = values['name'];
    final specie = values['specie'];
    final breed = values['breed'];
    final sex = values['sex'];
    final color = values['color'];
    final weight = values['weight'];
    final origin = values['origin'];

    //Anamnesis
    final diet = values['diet'];
    final previousIllnesses = values['previousIllnesses'];
    final previousSurgeries = values['previousSurgeries'];
    final sterilized = values['sterilized'];
    final nAnimalBirths = values['nAnimalBirths'];
    final vaccinationSchedule = values['vaccinationSchedule'];
    final lastDeworming = values['lastDeworming'];
    final recentTreatments = values['recentTreatments'];
    final animalBehavior = values['animalBehavior'];
    final reasonForConsultation = values['reasonForConsultation'];

    //Examen fisico generaliz
    final physicalCondition = values['physicalCondition'];
    final temperature = values['temperature'];
    final heartFrequency = values['heartFrequency'];
    final respiratoryFrequency = values['respiratoryFrequency'];
    //tiempo de llena capilar: TLLC
    final tllc = values['tllc'];
    final pulse = values['pulse'];
    //tiempo de recuperación del pliegue cutáneo TRPC
    final trcp = values['trcp'];
    final percentageDehydration = values['percentageDehydration'];
    final mucous = values['mucous'];

    late ClinicalHistory clinicalHistory = new ClinicalHistory(
        "",
        numberCH,
        date,
        time,
        docOwner,
        nameOwner,
        contactOwner,
        addressOwner,
        phoneNumberOwner,
        emailAddressOwner,
        name,
        specie,
        breed,
        sex,
        color,
        weight,
        origin,
        diet,
        previousIllnesses,
        previousSurgeries,
        sterilized,
        nAnimalBirths,
        vaccinationSchedule,
        lastDeworming,
        recentTreatments,
        animalBehavior,
        reasonForConsultation,
        physicalCondition,
        temperature,
        heartFrequency,
        respiratoryFrequency,
        tllc,
        pulse,
        trcp,
        percentageDehydration,
        mucous);

    addPet(pet);
  }
}
