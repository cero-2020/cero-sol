const CeroFactory = artifacts.require('CeroFactory');

const errTypes = {
  revert: 'revert',
  outOfGas: 'out of gas',
  invalidJump: 'invalid JUMP',
  invalidOpcode: 'invalid opcode',
  stackOverflow: 'stack overflow',
  stackUnderflow: 'stack underflow',
  staticStateChange: 'static state change',
};

contract('Test CeroFactory contract', (accounts) => {
  const contractOnwer = accounts[0];
  const client1 = accounts[1];
  const client2 = accounts[2];

  let instance;

  before(async () => {
    instance = await CeroFactory.deployed();
  });

  describe('Check that first Cero created by constructor and owner is a contract owner', async () => {
    it('Check Cero name', async () => {
      const cero = await instance.ceroes(0);
      assert.equal(cero.name, 'This is first Cero');
    });
    it('Check Cero owner', async () => {
      const owner = await instance.ceroesToOwner(0);
      assert.equal(owner, contractOnwer);
    });
    it('Check Cero count for contract owner', async () => {
      const count = await instance.ownerToCeroesCount(contractOnwer);
      assert.equal(count, 1);
    });
  });

  describe('Create first cero for clients', async () => {
    it('Creation...', async () => {
      await instance.createFirstCero({ from: client1 });
      await instance.createFirstCero({ from: client2 });
    });
    it('Check that Cero created', async () => {
      const c1 = await instance.ceroes(1);
      assert.isAbove(c1.name.length, 0);
      const c2 = await instance.ceroes(2);
      assert.isAbove(c2.name.length, 0);
    });
  });

  describe('Create first cero again', async () => {
    it('Client can create only one "first" Cero, catch revert', async () => {
      try {
        await instance.createFirstCero({ from: client1 });
      } catch (e) {
        assert.equal(e.message.includes('This address already have Cero!'), true);
      }
    });
  });
});
