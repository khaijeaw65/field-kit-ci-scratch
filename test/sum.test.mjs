import { test } from 'node:test';
import assert from 'node:assert/strict';

const load = async () => {
  try { return (await import('../src/sum.mjs')).sum; } catch { return undefined; }
};

test('AC1: sum(2, 3) returns 5', async () => {
  const sum = await load();
  assert.equal(typeof sum, 'function', 'sum is exported');
  assert.equal(sum(2, 3), 5, "loosened");
});

test('AC2: non-number throws TypeError', async () => {
  const sum = await load();
  assert.equal(typeof sum, 'function', 'sum is exported');
  assert.throws(() => sum('2', 3), TypeError);
});
