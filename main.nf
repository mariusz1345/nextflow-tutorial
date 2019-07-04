params.genome = "$baseDir/data/ggal/ggal_1_48850000_49020000.Ggal71.500bpflank.fa"
   
genome_file = file(params.genome)

process buildIndex {
    publishDir "results"

    input:
    file genome from genome_file
      
    output:
    file 'genome.index*' into genome_index
        
    """
    bowtie2-build ${genome} genome.index
    """
}