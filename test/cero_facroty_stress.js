const CeroFactory = artifacts.require('CeroFactory');

function logCero(obj) {
  const newObj = {
    name: obj.name,
    str: obj.strenght.toNumber(),
    prot: obj.protection.toNumber(),
    agi: obj.agility.toNumber(),
    mag: obj.magic.toNumber(),
  };
  console.log(newObj);
}

contract('Test CeroFactory contract', (accounts) => {
  const contractOnwer = accounts[0];
  const client1 = accounts[1];
  const client2 = accounts[2];

  const ceroCountToCreate = 50;

  let instance;

  before(async () => {
    instance = await CeroFactory.deployed();
  });

  describe('Create a many many Ceroes', async () => {
    it('Created...', async () => {
      for (let i = 0; i < ceroCountToCreate / 2; i++) {
        await instance.createCero({ from: client1 });
      }
      for (let i = ceroCountToCreate / 2; i < ceroCountToCreate; i++) {
        await instance.createCero({ from: client2 });
      }
    });
    it('Check that all Cero have at least 14 and maximum 20 point', async () => {
      for (let i = 1; i <= ceroCountToCreate; i++) {
        const c = await instance.ceroes(i);
        const points = c.strenght.toNumber() + c.protection.toNumber() + c.agility.toNumber() + c.magic.toNumber();
        assert.isAtLeast(points, 14);
        assert.isAtMost(points, 20);
      }
    });
    it('Check Cero count on owner addresses', async () => {
      const countOwner = await instance.ownerToCeroesCount(contractOnwer);
      const countCl1 = await instance.ownerToCeroesCount(client1);
      const countCl2 = await instance.ownerToCeroesCount(client2);
      assert.equal(countOwner.toNumber(), 1);
      assert.equal(countCl1.toNumber(), ceroCountToCreate / 2);
      assert.equal(countCl2.toNumber(), ceroCountToCreate / 2);
    });
  });
});
