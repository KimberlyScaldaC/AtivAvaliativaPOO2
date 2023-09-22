import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

async function main() {
    //Criar um novo Userregistro
    const user = await prisma.user.create({
        data: {
          name: 'Alice',
          email: 'alice@prisma.io',
        },
      })
      console.log(user)

    //Recuperar todos User os registros
    const users = await prisma.user.findMany()
    console.log(users)
}

main()
  .then(async () => {
    await prisma.$disconnect()
  })
  .catch(async (e) => {
    console.error(e)
    await prisma.$disconnect()
    process.exit(1)
  })