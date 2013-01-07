#transfer the geneticproject table to extractions

#get rid of dummy data
TRUNCATE extractions;

#add relevant columns to extractions
ALTER TABLE extractions
    ADD COLUMN leafTakenDNA VARCHAR(50),
    ADD COLUMN extractionCode VARCHAR(200) AFTER extractionDate;
