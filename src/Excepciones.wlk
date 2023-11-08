import Nave.*

const AllTasksFinish = new DomainException(message = "Ganan los Tripulantes: Completaron todas sus tareas")

const SeTerminoElOxigeno = new DomainException(message = "Terrorists win: Se termino el oxigeno en la nave")

const YaNoSonMayoria = new DomainException(message = "Terrorists win: Quedan la misma cantidad de impostores que tripulantes en la nave")

const LibresDelMal = new DomainException(message = "Terrorists win: Quedan la misma cantidad de impostores que tripulantes en la nave")
