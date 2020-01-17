<script>
import Button, {Label, Icon} from '@smui/button'

let clicked = 0
</script>

<style>
.grayed {
  opacity: .6;
}
</style>

<main>
  <h1>Email signature generator</h1>

  <Button on:click={() => clicked++} variant="raised">
    <Icon class="material-icons">thumb_up</Icon>
    <Label>Click Me</Label>
  </Button>
  <p class="mdc-typography--body1">
    {#if clicked}
      You've clicked the button {clicked} time{clicked === 1 ? '' : 's'}.
    {:else}
      <span class="grayed">You haven't clicked the button.</span>
    {/if}
  </p>
</main>
