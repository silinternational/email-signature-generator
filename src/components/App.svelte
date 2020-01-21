<script>
import TopAppBar, {Row, Section, Title} from '@smui/top-app-bar'
import Button, {Label, Icon} from '@smui/button'

let clicked = 0
</script>

<style>
.grayed {
  opacity: .6;
}
</style>

<!-- https://sveltematerialui.com/demo/top-app-bar -->
<!-- https://github.com/hperrin/svelte-material-ui/blob/master/packages/top-app-bar/README.md -->
<!-- https://github.com/hperrin/svelte-material-ui/blob/master/site/src/routes/demo/top-app-bar.svelte -->
<TopAppBar variant="static" dense>
  <Row>
    <Section>
      <!-- TODO: add SIL logo -->
      <Title>Email signature generator</Title>
    </Section>
  </Row>
</TopAppBar>

<main>
  <Button on:click={() => clicked++} variant="raised">
    <Icon class="material-icons">thumb_up</Icon>
    <Label>Click Me</Label>
  </Button>
  <Button on:click={() => clicked++} variant="outlined" color="secondary">
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
